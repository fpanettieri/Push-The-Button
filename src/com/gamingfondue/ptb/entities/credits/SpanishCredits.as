package com.gamingfondue.ptb.entities.credits
{
	import com.gamingfondue.ptb.entities.Statistics;

	public class SpanishCredits
	{
		public static function get queue():Array
		{
			var elapsed:int = Statistics.end - Statistics.begin;
			var minutes:int = elapsed / 60 / 1000;
			var seconds:int = (elapsed / 1000) % 60;
			
			return [
				"Bueno, nadie es perfecto...",
				"Estas muerto",
				"No perdiste! Simplemente, se termino",
				"Ya no te necesito",
				"Viviste " + minutes + " minutos, " + seconds + " segundos",
				"Que desperdicio",
				"Ganaste $" + Statistics.money,
				"Fuiste 'feliz' " + Statistics.happiness + " dias",
				"Ahora se bueno y ve a apretar botones por alli",
				"Te llamare si te necesito",
				"Este es el fin",
				" ",
				"O no?",
				"Gracias por jugar 'Push The Button'",
				"Esperamos que lo hayas disfrutado",
				"<El equipo de Gaming Fondue>",
				"Luigi Panettieri: Tester",
				"Liliana Pinto: Tester",
				"Enzo Panettieri: Director musical",
				"Carolina Sanchez: Escritora, Tester lider",
				"Fabio R. Panettieri: Director, Productor, Artista, Programador, Escritor",
				"Presiona R para volver a empezar",
				"<Musica>",
				"Intro y creditos: Balrog Boogie [8-Bit Version] - Diablo Swing Orchestra‏",
				"Realidad: Moonlight Sonata [Remix] - Solarfist",
				"Mundo feliz: Moonlight Sonata, 3rd Movement [8-bit Version]",
				"Presiona R para volver a empezar"
			];
		}
	}
}