package com.tgame.shell.view.components.active
{
   import com.fireice.list.FListCellRenderer;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.manager.MainCharSeachPathManager;
   import flash.events.TextEvent;
   import flash.text.*;
   
   public class ActiveActiveListRender extends FListCellRenderer
   {
      
      private var _particular:String;
      
      private var _promulgatorFt:FTextArea;
      
      private var sayQ:int;
      
      private var strx1:String;
      
      private var ibl:int;
      
      public function ActiveActiveListRender()
      {
         super();
      }
      
      override public function initUI() : void
      {
         var tf:TextFormat;
         var ft:FTextArea;
         _height = 35;
         tf = new TextFormat();
         tf.align = "center";
         ft = new FTextArea();
         with(ft)
         {
            x = 3;
            y = 3;
            width = 75;
            wordWrap = true;
            if(data.type == 1)
            {
               textColor = StaticValue.ORANGE;
            }
            else if(data.type == 2)
            {
               textColor = StaticValue.BLUE;
            }
            else if(data.type == 3)
            {
               textColor = StaticValue.PURPLE50;
            }
            else if(data.type == 4)
            {
               textColor = StaticValue.WHITE;
            }
            text = data.activityTiem;
         }
         addChild(ft);
         ft = new FTextArea();
         with(ft)
         {
            defaultTextFormat = tf;
            x = 70;
            y = 3;
            width = 200;
            wordWrap = true;
            autoSize = TextFieldAutoSize.LEFT;
            if(data.type == 1)
            {
               textColor = StaticValue.ORANGE;
            }
            else if(data.type == 2)
            {
               textColor = StaticValue.BLUE;
            }
            else if(data.type == 3)
            {
               textColor = StaticValue.PURPLE50;
            }
            else if(data.type == 4)
            {
               textColor = StaticValue.WHITE;
            }
            htmlText = data.name;
         }
         addChild(ft);
         ft = new FTextArea();
         with(ft)
         {
            defaultTextFormat = tf;
            x = 235;
            y = 3;
            width = 100;
            wordWrap = true;
            autoSize = TextFieldAutoSize.LEFT;
            if(data.gradeestimate)
            {
               if(data.type == 1)
               {
                  textColor = StaticValue.ORANGE;
               }
               else if(data.type == 2)
               {
                  textColor = StaticValue.BLUE;
               }
               else if(data.type == 3)
               {
                  textColor = StaticValue.PURPLE50;
               }
               else if(data.type == 4)
               {
                  textColor = StaticValue.WHITE;
               }
            }
            else
            {
               textColor = StaticValue.RED;
            }
            if(data.grade == 0)
            {
               htmlText = LanResManager.getLanTextWords(this,"不限");
            }
            else
            {
               htmlText = data.grade + LanResManager.getLanTextWords(this,"级");
            }
         }
         addChild(ft);
         this._promulgatorFt = new FTextArea();
         with(this._promulgatorFt)
         {
            defaultTextFormat = tf;
            x = 333;
            y = 3;
            width = 100;
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
            x = 450;
            y = 3;
            width = 100;
            wordWrap = true;
            autoSize = TextFieldAutoSize.LEFT;
            if(data.timeestimate)
            {
               textColor = StaticValue.GREEN;
            }
            else if(data.type == 1)
            {
               textColor = StaticValue.ORANGE;
            }
            else if(data.type == 2)
            {
               textColor = StaticValue.BLUE;
            }
            else if(data.type == 3)
            {
               textColor = StaticValue.PURPLE50;
            }
            else if(data.type == 4)
            {
               textColor = StaticValue.WHITE;
            }
            if(data.time == "0/0")
            {
               htmlText = LanResManager.getLanTextWords(this,"不限");
            }
            else
            {
               htmlText = data.time;
            }
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

