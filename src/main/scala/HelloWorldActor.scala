import akka.actor.{ActorRef, Actor, Props}
import akka.event.Logging

object HelloWorldActor {
  // case object Start
  case object Tick
}


class HelloWorldActor extends Actor {
  val logger = Logging(context.system, this)
  var greeter : Option[ActorRef] = None

  override def preStart() = {
    greeter = Some(context.actorOf(Props[Greeter], "greeter"))
  }

  def doGreet(): Unit = {
    logger.info("doing greet")
    // create the greeter actor
    // tell it to perform the greeting
    greeter match {
      case Some(g) => g ! Greeter.Greet
    }
  }
  def receive: Actor.Receive = {
    // case HelloWorldActor.Start => this.doGreet()
    // when the greeter is done, stop this actor and with it the application
    // case Greeter.Done => context.stop(self)
    case HelloWorldActor.Tick => this.doGreet()
  }
}
