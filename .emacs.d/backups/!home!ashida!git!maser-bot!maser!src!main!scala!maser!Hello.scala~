package maser

import com.typesafe.scalalogging.Logger

object Hello extends App {
  implicit val token = "309059165:AAEpzBsbq_BtYDLBsefOFApiqu7ouoglAxE"
  val logger = Logger("Main")
  logger.info("Starting bot")
  implicit val methods: MaserCommands  = MaserCommands(token)
  methods.run()
}
