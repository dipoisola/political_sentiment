package creeper

import scala.io.Source
import play.api.libs.json._
import play.api.libs.json.Reads._
import play.api.libs.functional.syntax._

case class Party(name: String, abbrev: String, aliases: List[String])

object Party {

  implicit val partyReads: Reads[Party] = (
      (JsPath \ "name").read[String] and
      (JsPath \ "abbrev").read[String] and 
      (JsPath \ "aliases").read[List[String]]
    )(Party.apply _)
  
  def list(): List[Party] = {
    Json.parse(
      Source.fromFile("./../data/parties.json").mkString
    ).as[List[Party]]
  }
}

