package com.gamingfondue.ptb.entities.credits
{
	import com.gamingfondue.ptb.entities.Statistics;

	public class EnglishCredits
	{
		public static function get queue():Array
		{
			var elapsed:int = Statistics.end - Statistics.begin;
			var minutes:int = elapsed / 60 / 1000;
			var seconds:int = (elapsed / 1000) % 60;
			
			return [
				"Well, nobody's perfect...",
				"You're dead",
				"You didn't lose the game! It's simply over",
				"I don't need you anymore",
				"You lived "  + Statistics.age + " winters in " + minutes + " minutes, " + seconds + " seconds",
				"What a waste",
				"You earned $" + Statistics.money,
				"Not enough",
				"You were 'happy' " + Statistics.happiness + " days",
				"Too little",
				"Now be good and go push buttons in other place",
				"I'll call you if I need you",
				"This is the end",
				" ",
				"Or not?",
				"Thank you for playing 'Push The Button'",
				"We hope you enjoyed it",
				"<Gaming Fondue team>",
				"Luigi Panettieri: Tester",
				"Liliana Pinto: Tester",
				"Enzo Panettieri: Musical director",
				"Carolina Sanchez: Writer, Tester, Level design",
				"Fabio R. Panettieri: Director, Game Designer, Producer, Artist, Programmer, Writer, Level designer",
				"Press R to restart",
				"<Music>",
				"Intro y credits: Balrog Boogie [8-Bit Version] - Diablo Swing Orchestra‏",
				"Reality: Moonlight Sonata [Remix] - Solarfist",
				"Happy world: Moonlight Sonata, 3rd Movement [8-bit Version]",
				"Press R to restart"
			];
		}
	}
}