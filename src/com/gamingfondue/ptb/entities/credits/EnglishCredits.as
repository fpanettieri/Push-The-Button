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
				"Game over. You're fired",
				"You didn't lose the game! The company doesn't need you anymore",
				"You lived "  + Statistics.age + " winters in " + minutes + " minutes, " + seconds + " seconds. Wasted time",
				"You earned $" + Statistics.money,
				"You were 'happy' " + Statistics.happiness + " days, HA!",
				"Now be good and go push buttons in other place",
				"I'll call you if we need you, This is the end",
				"Or not?",
				"Thank you for playing 'Push The Button', we hope you enjoyed it",
				"This is the end of the game, but not of the story. You can still change it...",
				"Press R to restart",
				"<Gaming Fondue team>",
				"Luigi Panettieri: Tester",
				"Liliana Pinto: Tester",
				"Enzo Panettieri: Musical director",
				"Carolina Sanchez: Writer, Tester lider",
				"Fabio R. Panettieri: The rest :D",
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