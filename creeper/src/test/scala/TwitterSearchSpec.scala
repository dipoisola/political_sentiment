import org.scalatest._

import creeper.{TwitterSearch, Party}


class TwitterSearchSpec extends FunSuite with DiagrammedAssertions {
  test("TwitterSearch can generate search query for party") {
    val parties = List[Party](
      Party("3 Legs", "3LEGS", List[String]()),
      Party("4 Legs", "4LEGS", List[String]())
    )
    val queries = TwitterSearch.queries(parties)

    assert(queries.exists(_ == "3+legs"))
  }

  test("TwitterSearch can generate query for party with alias") {
    val party1Alias = List[String](
        "If the Easter Bunny and the Tooth Fairy had babies would they take your teeth and leave chocolate for you?",
        "I love eating toasted cheese and tuna sandwiches.",
        "Sixty-Four comes asking for bread.",
     )
    val party2Alias = List[String](
        "Last Friday in three week’s time I saw a spotted striped blue worm shake hands with a legless lizard.",
        "She folded her handkerchief neatly.",
      )
    val parties = List[Party](
      Party("3 Legs", "3LEGS", party1Alias),
      Party("4 Legs", "4LEGS", party2Alias)
    )
    val queries = TwitterSearch.queries(parties)

    assert(
      queries.last.endsWith("she+folded+her+handkerchief+neatly.")
    )
  }

}
