Scala – Example of Using case class , map, vectors

object Main {
	def main(args: Array[String]) {

		case class Player (name:String, age:Int , dept: String)

		def makePlayer(line:String) : Player = {

			val a = line.split(“-“)
			val player_name = a(0)
			val player_age  = a(1).toInt
			val player_dept =a(2)

			Player(player_name,player_age, player_dept)

		// Alternatively
		//val ad = Player(player_name,player_age, player_dept)
		//return ad
		}

		val source = Source.fromFile(“C:/Users/dattas6/Desktop/Test/ScalaTest/input.txt”)

		// format of input.txt file – Name-Age-Dept
		// 			      Owen-50-ABCD
		//                            James-50-MFX

		val lines = source.getLines()

		val players = lines.map(makePlayer).toArray
		source.close
		players.foreach(println)
	}
}
