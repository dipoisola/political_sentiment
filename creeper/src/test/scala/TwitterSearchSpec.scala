import org.scalatest._

import creeper.{TwitterSearch, Party}


class TwitterSearchSpec extends FunSuite with DiagrammedAssertions {
  test("TwitterSearch can make query at char limits") {
    val parties = List[Party](
      Party("3 Legs", "3LEGS", List[String]()),
      Party("4 Legs", "4LEGS", List[String]())
    )

    assert(
      TwitterSearch
        .queryAtCharLimits(parties)
        .exists(_ == "%223+legs%22%20OR%20%224+legs%22")
    )
  }

  test("TwitterSearch can make queries when above char limits") {
    val parties = List[Party](
      Party("3 Legs", "3LEGS", List[String](
        "If the Easter Bunny and the Tooth Fairy had babies would they take your teeth and leave chocolate for you?",
        "I love eating toasted cheese and tuna sandwiches.",
        "Last Friday in three week’s time I saw a spotted striped blue worm shake hands with a legless lizard.",
        "She folded her handkerchief neatly.",
        "Sixty-Four comes asking for bread.",
        "Sometimes it is better to just walk away from things and go back to them later when you’re in a better frame of mind.",
        "The memory we used to share is no longer coherent."
      )),
      Party("4 Legs", "4LEGS", List[String]())
    )
    assert(
      TwitterSearch
        .queryAtCharLimits(parties)
        .length == 2
    )
  }

}
