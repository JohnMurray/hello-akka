import akka.actor.{ActorSystem, Props}
import akka.kernel.Bootable
import scala.concurrent.duration._

class HelloWorldKernel extends Bootable {
  val system = ActorSystem("helloworldkernel")
  import system.dispatcher

  def startup() {
    // system.actorOf(Props[HelloWorldActor]) ! HelloWorldActor.Start
    val helloWorldActor = system.actorOf(Props[HelloWorldActor])
    system.scheduler.schedule(0 milliseconds,
      500 milliseconds,
      helloWorldActor,
      HelloWorldActor.Tick)
  }

  def shutdown() {
    system.shutdown()
  }
}
