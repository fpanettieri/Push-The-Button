package com.gamingfondue.util
{
	import flash.utils.ByteArray;
	
	/**
	 * Helper class used extract embedded xml
	 * 
	 * @author: Fabio R. Panettieri
	 */
	public class XMLReader
	{
		/**
		 * Parses an embedded xml, usually available as a 'Class' object
		 * and generates a nice XML.
		 * 
		 * @param	xml Embeded resource. 
		 */
		public function read(xml:Class):XML
		{
			var raw:ByteArray = new xml();
			return new XML(raw.readUTFBytes(raw.length));
		}
	}
}
