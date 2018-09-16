import org.scalatest._

class MainSpec extends FunSuite with DiagrammedAssertions {
  test("Hello should start with H") {
    assert("Hello".startsWith("H"))
  }
}