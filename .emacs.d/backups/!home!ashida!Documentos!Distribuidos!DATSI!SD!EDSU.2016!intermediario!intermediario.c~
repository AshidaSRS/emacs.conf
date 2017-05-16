#include <sys/socket.h>
#include <netinet/in.h>
#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <stdlib.h>
#include <malloc.h>
#include "comun.h"

#define META_TEMA_INICIAL "__CREACION Y ELIMINACION__"

typedef struct suscriptor {
	struct sockaddr_in * cliente;

} suscriptor;

typedef suscriptor * suscript;

typedef struct tema {
	char * tema;
	int cantSuscript;
	suscript * suscriptores;
} tema;

typedef struct lista_temas {
	tema** temas;
	int cant_temas;
} lista_temas;

void imprimir_temas(const lista_temas* temas);
void imprimir_tema(const tema* tema);
lista_temas* inicializar_temas(const char* archivo);
tema* crear_tema(const char* tematica);
int agregar_tema(lista_temas* temas, const char* tematica);
void traza_estado(const char *mensaje, const char* port);
tema* buscarTema(char* tema, lista_temas * listaTemas);
int procesarNotificacion(notif notificacion, lista_temas* listaTemas);
int procesarBaja(char* tematica, int puerto, struct sockaddr_in * cliente,
		lista_temas * listaTemas);
int procesarAlta(char* tematica, int puerto, struct sockaddr_in * cliente,
		lista_temas* listaTemas);
int procesarMensaje(char* tematica, char* mensaje, lista_temas* listaTemas);
void enviarMensaje(int opt, char** argumentos, int cantArgumentos,
		struct sockaddr_in * cliente);
int sonIguales(struct sockaddr_in * sock1, struct sockaddr_in * sock2);
int procesarApagado(int puerto, struct sockaddr_in * cliente,
		lista_temas * temas);
int procesarCreacion(char * tematica, lista_temas* temas);
int procesarEliminacion(char* tematica, lista_temas* temas);
int procesarInicio(int puerto, struct sockaddr_in * cliente,
		lista_temas * temas);
void traza_estado(const char *mensaje, const char* port) {
	printf("\n------------------- %s --------------------\n", mensaje);
	system("netstat -at | head -2 | tail -1");
	char comando[30];
	strcpy(comando, "netstat -at | grep ");
	strcat(comando, port);
	system(comando);
	printf("---------------------------------------------------------\n\n");
}

lista_temas* inicializar_temas(const char* archivo) {

	lista_temas* resp = malloc(sizeof(lista_temas));
	resp->cant_temas = 0;
	resp->temas = NULL;

	FILE* file = fopen(archivo, "r");
	char* tematica = NULL;
	int longitud = 0;
	int c;
	while ((c = getc(file)) != -1) {
		if (c == '\n') {
			if (longitud > 0) {
				tematica[longitud] = '\0';

				agregar_tema(resp, tematica);

				longitud = 0;
			}
		} else {
			if (longitud % BLOQUE == 0)
				tematica = realloc(tematica,
						(longitud + BLOQUE) * sizeof(char));
			tematica[longitud++] = c;
		}

	}
	if (longitud != 0) {
		tematica[longitud] = '\0';
		agregar_tema(resp, tematica);
	}
	free(tematica);
	fclose(file);
	agregar_tema(resp, META_TEMA_INICIAL);
	return resp;
}

int agregar_tema(lista_temas* temas, const char* tematica) {
	if (temas->cant_temas % BLOQUE == 0) {
		temas->temas = realloc(temas->temas,
				(temas->cant_temas + BLOQUE) * sizeof(tema*));
	}

	temas->temas[temas->cant_temas] = crear_tema(tematica);
	temas->cant_temas++;

	return 1;
}

tema* crear_tema(const char* tematica) {

	tema * resp = malloc(sizeof(tema));
	resp->cantSuscript = 0;
	resp->suscriptores = malloc(sizeof(suscript *));
	resp->tema = NULL;
	int i = 0;
	while (tematica[i] != '\0') {
		if (i % BLOQUE == 0)
			resp->tema = realloc(resp->tema, (i + BLOQUE) * sizeof(char));
		resp->tema[i] = tematica[i];
		i++;
	}
	resp->tema[i] = '\0';
	return resp;
}
tema* buscarTema(char* tema, lista_temas * listaTemas) {
	int i = 0;
	for (i = 0; i < listaTemas->cant_temas; i++) {
		if (strcmp(listaTemas->temas[i]->tema, tema) == 0) {
			return listaTemas->temas[i];
		}
	}
	return NULL ;
}
void imprimir_temas(const lista_temas* temas) {
	int i = 0;
	printf("Hay %d temas disponibles \n", temas->cant_temas);
	for (i = 0; i < temas->cant_temas; i++) {
		imprimir_tema(temas->temas[i]);
	}
}

void imprimir_tema(const tema* tema) {
	printf("El nombre del tema es %s y hay %d procesos suscriptos \n",
			tema->tema, tema->cantSuscript);

}

int sonIguales(struct sockaddr_in * sock1, struct sockaddr_in * sock2) {

	if ((sock1->sin_port == sock2->sin_port)
			&& (sock1->sin_addr.s_addr == sock2->sin_addr.s_addr)) {
		return 1;
	}
	return 0;
}

int procesarNotificacion(notif notificacion, lista_temas* listaTemas) {

	switch (notificacion->opt) {
	case BAJA:
		return procesarBaja(notificacion->tema, notificacion->puerto,
				notificacion->cliente, listaTemas);
	case ALTA:
		return procesarAlta(notificacion->tema, notificacion->puerto,
				notificacion->cliente, listaTemas);

	case MENSAJE:
		return procesarMensaje(notificacion->tema, notificacion->mensaje,
				listaTemas);
	case APAGADO:
		return procesarApagado(notificacion->puerto, notificacion->cliente,
				listaTemas);
	case CREAR:
		return procesarCreacion(notificacion->tema, listaTemas);
	case ELIMINAR:
		return procesarEliminacion(notificacion->tema, listaTemas);
	case INICIO:
		return procesarInicio(notificacion->puerto, notificacion->cliente,
				listaTemas);
	}
	return -1;
}

int procesarInicio(int puerto, struct sockaddr_in * cliente,
		lista_temas * temas) {
	return procesarAlta(META_TEMA_INICIAL, puerto, cliente, temas);
}

int procesarCreacion(char * tematica, lista_temas* temas) {
	tema* existe = buscarTema(tematica, temas);
	if (existe != NULL )
		return -1;
	tema * temaBus = buscarTema(META_TEMA_INICIAL, temas);
	int i = 0;
	char* argumentos[1];
	argumentos[0] = tematica;
	for (i = 0; i < temaBus->cantSuscript; i++) {
		enviarMensaje(CREAR, argumentos, 1, temaBus->suscriptores[i]->cliente);
	}

	agregar_tema(temas, tematica);

	return 1;
}

int procesarEliminacion(char* tematica, lista_temas* temas) {

	int i = 0, encontrado = -1;
	for (i = 0; i < temas->cant_temas && encontrado < 0; i++) {
		if (strcmp(temas->temas[i]->tema, tematica) == 0) {
			encontrado = i;
		}
	}
	if (encontrado == -1)
		return -1;

	char* argumentos[1];
	argumentos[0] = tematica;

	tema * temaBus = buscarTema(META_TEMA_INICIAL, temas);

	for (i = 0; i < temaBus->cantSuscript; i++) {
		enviarMensaje(ELIMINAR, argumentos, 1,
				temaBus->suscriptores[i]->cliente);
	}

	for (i = 0; i < temas->temas[encontrado]->cantSuscript; i++) {
		free(temas->temas[encontrado]->suscriptores[i]->cliente);
	}
	free(temas->temas[encontrado]->suscriptores);
	free(temas->temas[encontrado]->tema);
	free(temas->temas[encontrado]);
	temas->cant_temas -= 1;
	temas->temas[encontrado] = temas->temas[temas->cant_temas];
	return 1;
}

int procesarApagado(int puerto, struct sockaddr_in * cliente,
		lista_temas * temas) {
	int i = 0;

	for (i = 0; i < temas->cant_temas; i++) {
		procesarBaja(temas->temas[i]->tema, puerto, cliente, temas);
	}
	return 0;
}

int procesarBaja(char* tematica, int puerto, struct sockaddr_in * cliente,
		lista_temas * listaTemas) {

	cliente->sin_port = htons(puerto);
	cliente->sin_family = PF_INET;
	int i = 0;
	tema * temaBus = buscarTema(tematica, listaTemas);
	if (temaBus == NULL )
		return -1;
	for (i = 0; i < temaBus->cantSuscript; i++) {
		if (sonIguales(cliente, temaBus->suscriptores[i]->cliente)) {
			free(temaBus->suscriptores[i]->cliente);
			free(temaBus->suscriptores[i]);
			temaBus->cantSuscript--;
			temaBus->suscriptores[i] =
					temaBus->suscriptores[temaBus->cantSuscript];
			return 0;
		}
	}

	return -1;
}

int procesarAlta(char* tematica, int puerto, struct sockaddr_in * cliente,
		lista_temas* listaTemas) {

	struct sockaddr_in aux;
	memcpy((void *) &aux, (void*) cliente, sizeof(aux));
	aux.sin_port = htons(puerto);
	aux.sin_family = PF_INET;

	tema* temaBus = buscarTema(tematica, listaTemas);
	if (temaBus == NULL )
		return -1;
	int cantSus = temaBus->cantSuscript;
	int i = 0;
	for (i = 0; i < temaBus->cantSuscript; i++) {
		if (sonIguales(temaBus->suscriptores[i]->cliente, &aux))
			return -1;
	}

	if (cantSus % BLOQUE == 0)
		temaBus->suscriptores = realloc(temaBus->suscriptores,
				(temaBus->cantSuscript + BLOQUE) * sizeof(suscript));
	temaBus->suscriptores[cantSus] = malloc(sizeof(suscriptor));
	temaBus->suscriptores[cantSus]->cliente = malloc(
			sizeof(struct sockaddr_in));
	memcpy((void*) temaBus->suscriptores[cantSus]->cliente, (void*) cliente,
			sizeof(struct sockaddr_in));
	temaBus->suscriptores[cantSus]->cliente->sin_port = htons(puerto);
	temaBus->suscriptores[cantSus]->cliente->sin_family = PF_INET;

	temaBus->cantSuscript += 1;

	return 0;
}

int procesarMensaje(char* tematica, char* mensaje, lista_temas* listaTemas) {

	tema * temaBus = buscarTema(tematica, listaTemas);
	if (temaBus == NULL ) {
		printf("Se recibio el tema:  %s y no existe \n", tematica);
		return -1;

	}
	int i = 0;
	char* argumentos[2];
	argumentos[0] = tematica;
	argumentos[1] = mensaje;
	for (i = 0; i < temaBus->cantSuscript; i++) {
		enviarMensaje(MENSAJE, argumentos, 2,
				temaBus->suscriptores[i]->cliente);
	}

	return 0;

}

void enviarMensaje(int opt, char** argumentos, int cantArgumentos,
		struct sockaddr_in * cliente) {
	int s, longitud;

	if ((s = socket(PF_INET, SOCK_STREAM, IPPROTO_TCP)) < 0) {
		perror("error creando socket");
		return;
	}

	if (connect(s, (struct sockaddr *) cliente, sizeof(struct sockaddr_in))
			< 0) {
		perror("error en connect");
		close(s);
		return;
	}

	char* mensajeAEnviar = marshallMsg(opt, argumentos, cantArgumentos,
			&longitud);

	if (write(s, mensajeAEnviar, longitud) < 0) {
		perror("error en write");
		close(s);
		return;
	}
	close(s);
	return;
}

int main(int argc, char *argv[]) {
	if (argc != 3) {
		perror("La cantidad de argumentos es invalida");
		return 1;
	}
	char * port = argv[1];
	int portInt = atoi(port);
	char* archivo = argv[2];
	lista_temas* listaTemas = inicializar_temas(archivo);
//imprimir_temas(listaTemas);

	int s, s_conec, leido;
	unsigned int tam_dir;
	struct sockaddr_in dir, dir_cliente;
	char buf[TAM];
	char mensajeRsp[5];
	int opcion = 1, resp = -1;
	char* mensaje = NULL;
	int mensajeLong = 0;

	if ((s = socket(PF_INET, SOCK_STREAM, IPPROTO_TCP)) < 0) {
		perror("error creando socket");
		return 1;
	}

	/* Para reutilizar puerto inmediatamente
	 */
	if (setsockopt(s, SOL_SOCKET, SO_REUSEADDR, &opcion, sizeof(opcion)) < 0) {
		perror("error en setsockopt");
		return 1;
	}
	dir.sin_addr.s_addr = INADDR_ANY;
	dir.sin_port = htons(portInt);
	dir.sin_family = PF_INET;
	if (bind(s, (struct sockaddr *) &dir, sizeof(dir)) < 0) {
		perror("error en bind");
		close(s);
		return 1;
	}

	if (listen(s, MAX_LISTEN) < 0) {
		perror("error en listen");
		close(s);
		return 1;
	}

//traza_estado("Despu�s de listen", port);

	while (1) {
		mensajeLong = 0;
		tam_dir = sizeof(dir_cliente);
		if ((s_conec = accept(s, (struct sockaddr *) &dir_cliente, &tam_dir))
				< 0) {
			perror("error en accept");
			close(s);
			return 1;
		}

		//traza_estado("Despu�s de accept", port);

		while ((leido = read(s_conec, buf, TAM)) > 0) {

			mensaje = realloc(mensaje, (mensajeLong + leido) * sizeof(char));

			memcpy((void*) (mensaje + mensajeLong), (void*) buf, leido);
			mensajeLong += leido;
		}

		notif notificacion = unMarshallMsg(mensaje);
		struct sockaddr_in peer;
		int tamanio = sizeof(peer);
		if (notificacion->opt == ALTA || notificacion->opt == BAJA
				|| notificacion->opt == INICIO || notificacion->opt == APAGADO) {
			getpeername(s_conec, (void *) &peer, (socklen_t *) &tamanio);
			notificacion->cliente = &peer;
		}
		resp = procesarNotificacion(notificacion, listaTemas);
		memcpy((void *) mensajeRsp, (void*) &resp, sizeof(int));
		mensajeRsp[4] = 0;

		if (write(s_conec, mensajeRsp, TAMANIO_RESPUESTA) < 0) {
			free(mensaje);
			perror("error en write");
			close(s);
			close(s_conec);
			return 1;
		}

		close(s_conec);
		//traza_estado("Despu�s de close de conexi�n", port);

	}

	close(s);

	return 0;

}
