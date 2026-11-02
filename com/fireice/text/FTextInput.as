package com.fireice.text
{
   import com.fireice.base.FUITextField;
   import com.fireice.util.Tools;
   import flash.events.Event;
   import flash.text.TextFieldType;
   import flash.text.TextFormat;
   
   public class FTextInput extends FUITextField
   {
      
      private var tf:TextFormat;
      
      private var _maxChars:uint;
      
      public function FTextInput()
      {
         super();
         this._maxChars = int.MAX_VALUE;
         type = TextFieldType.INPUT;
         multiline = false;
         this.tf = new TextFormat();
         this.tf.font = Tools.font;
         defaultTextFormat = this.tf;
      }
      
      public function setMaxChars(param1:uint) : void
      {
         this._maxChars = param1;
         if(param1 == 0 && this.hasEventListener(Event.CHANGE))
         {
            removeEventListener(Event.CHANGE,this.onChange);
         }
         addEventListener(Event.CHANGE,this.onChange);
      }
      
      private function onChange(param1:Event) : void
      {
         var _loc2_:String = this.text;
         while(this.getSBCSLength(_loc2_) > this._maxChars)
         {
            _loc2_ = _loc2_.substring(0,_loc2_.length - 1);
         }
         this.text = _loc2_;
      }
      
      private function getSBCSLength(param1:String) : int
      {
         return param1.replace(/[^\x00-\xFF]/g,"aa").length;
      }
   }
}

