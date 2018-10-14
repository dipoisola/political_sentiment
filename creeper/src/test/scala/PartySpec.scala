import org.scalatest._

import creeper.Party

class PartySpec extends FunSuite with DiagrammedAssertions {
  test("Party can return list") {
    assert(Party.list.isInstanceOf[List[Party]])
  }
}
