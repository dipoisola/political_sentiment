package creeper

import java.net.URLEncoder
import okhttp3.{OkHttpClient, Request, Response};

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

  def buildRequests(queries: List[String]): List[Request] = {
    val token = System.getenv("TWITTER_BEARER_TOKEN")
    val url = (q: String) => s"https://api.twitter.com/1.1/search/tweets.json?q=$q&result_type=recent&=" 
    
    queries.map((q: String) =>  
       new Request.Builder()
      .url(url(q))
      .get()
      .addHeader("Authorization", s"Bearer $token")
      .build()
    )
  }
  
  def execRequests(requests: List[Request]): List[Response] = {
    val client: OkHttpClient = new OkHttpClient();
    requests.map((req: Request) => client.newCall(req).execute())
  }

  def parseResponses(responses: List[Response]): Unit = {
     responses.map((resp: Response) => println(resp.body()) )
     ()
  }
}
