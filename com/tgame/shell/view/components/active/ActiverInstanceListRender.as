package com.tgame.shell.view.components.active
{
   import com.fireice.list.FListCellRenderer;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.manager.MainCharSeachPathManager;
   import flash.events.TextEvent;
   import flash.text.*;
   
   public class ActiverInstanceListRender extends FListCellRenderer
   {
      
      private var _particular:String;
      
      private var _promulgatorFt:FTextArea;
      
      private var sayQ:int;
      
      private var strx1:String;
      
      private var ibl:int;
      
      public function ActiverInstanceListRender()
      {
         super();
      }
      
      override public function initUI() : void
      {
         var tf:TextFormat;
         var ft:FTextArea;
         _height = 20;
         tf = new TextFormat();
         tf.align = "left";
         ft = new FTextArea();
         with(ft)
         {
            defaultTextFormat = tf;
            x = 3;
            y = 3;
            width = 110;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.ORANGE;
            text = data.name;
         }
         addChild(ft);
         ft = new FTextArea();
         with(ft)
         {
            defaultTextFormat = tf;
            x = 132;
            y = 3;
            width = 260;
            wordWrap = true;
            autoSize = TextFieldAutoSize.LEFT;
            if(data.gradeEstimate)
            {
               textColor = StaticValue.ORANGE;
            }
            else
            {
               textColor = StaticValue.RED;
            }
            htmlText = data.grade;
         }
         addChild(ft);
         ft = new FTextArea();
         with(ft)
         {
            defaultTextFormat = tf;
            x = 186;
            y = 3;
            width = 260;
            wordWrap = true;
            autoSize = TextFieldAutoSize.LEFT;
            if(data.processionEstimate)
            {
               textColor = StaticValue.ORANGE;
            }
            else
            {
               textColor = StaticValue.RED;
            }
            if(data.procession == 0)
            {
               htmlText = LanResManager.getLanTextWords(this,"混合");
            }
            else if(data.procession == 1)
            {
               htmlText = LanResManager.getLanTextWords(this,"单人");
            }
            else
            {
               htmlText = LanResManager.getLanTextWords(this,"人");
            }
         }
         addChild(ft);
         this._promulgatorFt = new FTextArea();
         with(this._promulgatorFt)
         {
            defaultTextFormat = tf;
            x = 233;
            y = 3;
            width = 260;
            wordWrap = true;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.GREEN;
            htmlText = "<u><a href=\'event:" + data.npcid + "\'>" + data.promulgator + "</a></u>";
         }
         addChild(this._promulgatorFt);
         this._promulgatorFt.addEventListener(TextEvent.LINK,this.onClick);
         ft = new FTextArea();
         with(ft)
         {
            defaultTextFormat = tf;
            x = 325;
            y = 3;
            width = 260;
            wordWrap = true;
            autoSize = TextFieldAutoSize.LEFT;
            if(data.timeEstimate)
            {
               textColor = StaticValue.ORANGE;
            }
            else
            {
               textColor = StaticValue.RED;
            }
            htmlText = data.time + LanResManager.getLanTextWords(this,"次");
         }
         addChild(ft);
         ft = new FTextArea();
         with(ft)
         {
            defaultTextFormat = tf;
            x = 377;
            y = 3;
            width = 260;
            wordWrap = true;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.ORANGE;
            htmlText = "";
            sayQ = 0;
            sayQ = data.hortation / 2;
            strx1 = "";
            ibl = 0;
            while(ibl < sayQ)
            {
               strx1 += "★";
               ++ibl;
            }
            if(data.hortation % 2 != 0)
            {
               if(data.hortation % 2 == 1)
               {
                  strx1 += "☆";
               }
            }
            htmlText = strx1;
         }
         addChild(ft);
         this._particular = data.particular;
      }
      
      private function onClick(param1:TextEvent) : void
      {
         MainCharSeachPathManager.mainCharWalk(param1.text);
      }
   }
}

