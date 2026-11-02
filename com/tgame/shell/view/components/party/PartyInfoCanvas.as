package com.tgame.shell.view.components.party
{
   import com.fireice.panel.FCanvas;
   import com.fireice.scroll.FVScorllBar;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.*;
   
   public class PartyInfoCanvas extends FCanvas
   {
      
      private var content:FTextArea;
      
      private var Scroll:FVScorllBar;
      
      public function PartyInfoCanvas()
      {
         super();
         skin = "box";
         width = 660;
         height = 280;
         this.content = new FTextArea();
         with(this.content)
         {
            mouseWheelEnabled = true;
            wordWrap = true;
            x = 6;
            y = 4;
            width = 640;
            height = 274;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
         }
         addChild(this.content);
         this.Scroll = new FVScorllBar(this.content,274);
         addChild(this.Scroll);
         this.Scroll.x = 643;
         this.Scroll.y = 4;
      }
      
      public function setInfo(param1:String) : void
      {
         if(this.content.numLines > 100)
         {
            this.content.htmlText.replace(/^(.*?)\<P\s*ALIGN=\"LEFT\"\>.*?\<\/P\>(.*)$/,"$1$2");
         }
         var _loc2_:Date = new Date();
         var _loc3_:String = "";
         _loc3_ += "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + _loc2_.hours + ":" + _loc2_.minutes + ":" + _loc2_.seconds + "  <font>";
         _loc3_ += param1;
         this.content.htmlText += _loc3_;
         this.content.scrollV = this.content.maxScrollV;
      }
      
      public function setChat(param1:String, param2:String) : void
      {
         if(this.content.numLines > 100)
         {
            this.content.htmlText.replace(/^(.*?)\<P\s*ALIGN=\"LEFT\"\>.*?\<\/P\>(.*)$/,"$1$2");
         }
         var _loc3_:String = "";
         _loc3_ += "<font color=\'#b0e0e6\'>" + param1 + "</font>" + LanResManager.getLanCommonTextWords("说：") + this.filterItem(param2);
         this.content.htmlText += _loc3_;
         this.content.scrollV = this.content.maxScrollV;
      }
      
      public function filterItem(param1:String) : String
      {
         var _loc3_:int = 0;
         var _loc4_:String = null;
         var _loc5_:Array = null;
         var _loc2_:int = -1;
         while(true)
         {
            _loc2_ = param1.search("ξgoods");
            if(_loc2_ == -1)
            {
               break;
            }
            _loc3_ = param1.indexOf(";",_loc2_);
            if(_loc3_ != -1)
            {
               _loc4_ = param1.slice(_loc2_,_loc3_);
               _loc5_ = _loc4_.split(",");
               param1 = param1.slice(0,_loc2_) + "<font color=\'" + _loc5_[_loc5_.length - 2] + "\'>" + "【" + _loc5_[_loc5_.length - 1] + "】" + "</font>" + param1.slice(_loc3_ + 1,param1.length);
            }
         }
         return param1;
      }
   }
}

