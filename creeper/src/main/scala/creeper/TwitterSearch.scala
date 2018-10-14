package creeper

import java.net.URLEncoder

object TwitterSearch {
  def queryAtCharLimits(parties: List[Party]): List[String] = {
    val search = parties.flatMap(
      p => List(
        s""""${p.name.trim.toLowerCase}"""", p.aliases.fold ("")(_ ++ _)
      )
    )
    val nonEmptySearch = search
        .filter(s => s != "")

    var queries = List[String]()
    val sb = new StringBuilder
    val op = "%20OR%20"
    for (s <- nonEmptySearch) {
      sb ++= URLEncoder.encode(s, "UTF-8")
      sb ++= op
      if(sb.lengthCompare(490) > 0) {
          queries :+= sb.stripSuffix(op).mkString
          sb.clear()
      }
    }
    queries :+= sb.stripSuffix(op).mkString
    return queries
  }
}
