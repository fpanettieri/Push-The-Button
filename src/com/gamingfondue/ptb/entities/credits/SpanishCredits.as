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
				"Fin del juego. Estas despedido",
				"No perdiste! La empresa no te necesita",
				"Viviste " + Statistics.age + " inviernos en " + minutes + " minutos, " + seconds + " segundos. Tiempo perdido",
				"Ganaste $" + Statistics.money * 100,
				"Fuiste 'feliz' " + Statistics.happiness + " dias, JA!",
				"Ahora se bueno y sigue apretando botones en otro lado",
				"Te llamare si te necesitamos. Este es el fin",
				"O no?",
				"Gracias por jugar 'Push The Button', esperamos que lo hayas disfrutado",
				"Este es el final del juego, pero no de la historia. Todavia puedes cambiarla...",
				"Presiona R para volver a empezar",
				"<El equipo de Gaming Fondue>",
				"Luigi Panettieri: Tester",
				"Liliana Pinto: Tester",
				"Enzo Panettieri: Director musical",
				"Carolina Sanchez: Escritora, Tester lider",
				"Fabio R. Panettieri: El resto :D",
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