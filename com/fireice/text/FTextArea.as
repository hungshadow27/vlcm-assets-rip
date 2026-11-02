package com.fireice.text
{
   import com.fireice.base.FUITextField;
   import com.fireice.util.Tools;
   import flash.text.TextFormat;
   
   public class FTextArea extends FUITextField
   {
      
      private var tf:TextFormat;
      
      public function FTextArea()
      {
         super();
         selectable = false;
         multiline = true;
         mouseWheelEnabled = false;
         this.tf = new TextFormat();
         this.tf.font = Tools.font;
         this.tf.leading = 4;
         defaultTextFormat = this.tf;
      }
   }
}

