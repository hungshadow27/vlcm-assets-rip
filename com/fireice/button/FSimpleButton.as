package com.fireice.button
{
   import com.fireice.init.SkinInit;
   import com.fireice.util.Tools;
   
   public class FSimpleButton extends FBaseSimpleButton
   {
      
      private var _skin:String;
      
      public function FSimpleButton()
      {
         super(null,null,null);
      }
      
      override public function set skin(param1:String) : void
      {
         var skinXml:XML = null;
         var xml:XML = null;
         var value:String = param1;
         if(value == "")
         {
            return;
         }
         this._skin = value;
         skinXml = SkinInit.getSkinConfigByName(value);
         xml = skinXml.upImage[0];
         try
         {
            up = Tools.get9GridBitmpByName(xml);
         }
         catch(e:Error)
         {
            trace("加载按钮皮肤" + value + "错误");
         }
         xml = skinXml.overImage[0];
         try
         {
            over = Tools.get9GridBitmpByName(xml);
         }
         catch(e:Error)
         {
            xml = skinXml.upImage[0];
            over = Tools.get9GridBitmpByName(xml);
         }
         xml = skinXml.downImage[0];
         try
         {
            down = Tools.get9GridBitmpByName(xml);
         }
         catch(e:Error)
         {
            xml = skinXml.upImage[0];
            down = Tools.get9GridBitmpByName(xml);
         }
      }
      
      override public function get skin() : String
      {
         return this._skin;
      }
   }
}

