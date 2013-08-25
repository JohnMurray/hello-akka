import akka.actor.Actor

object Greeter {
  case object Greet
}
class Greeter extends Actor {
  def receive = {
    case Greeter.Greet => {
      println("Hello, World")
    }
  }
}
