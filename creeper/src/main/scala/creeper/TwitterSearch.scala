package creeper

import java.net.URLEncoder

object TwitterSearch {
  def queries(parties: List[Party]): List[String] = {
    val operator = "%20OR%20"

    val words = parties.map(
      p => List(p.name.trim.toLowerCase) ::: p.aliases.map(_.toLowerCase)
    )
    
    val nonEmptyWords = words
        .filter(s => s != "")
    
    return nonEmptyWords.map( 
      s => URLEncoder.encode(
        s.mkString(operator), "UTF-8"
      )
    )
  }
}
