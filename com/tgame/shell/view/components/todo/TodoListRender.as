package com.tgame.shell.view.components.todo
{
   import com.fireice.list.FListCellRenderer;
   import com.fireice.text.FTextArea;
   import com.tgame.common.ui.componets.*;
   import com.tgame.manager.MainCharSeachPathManager;
   import flash.display.DisplayObject;
   import flash.events.TextEvent;
   import flash.text.*;
   
   public class TodoListRender extends FListCellRenderer
   {
      
      private var dianjiTxt:FTextArea;
      
      private var bl:int;
      
      private var _parent:DisplayObject;
      
      private var fun:Function;
      
      private var tid:int;
      
      public function TodoListRender()
      {
         super();
      }
      
      override public function initUI() : void
      {
         var ft:FTextArea;
         var tf:TextFormat = new TextFormat();
         tf.align = "left";
         ft = new FTextArea();
         with(ft)
         {
            defaultTextFormat = tf;
            x = 15;
            y = 2;
            width = 110;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.GREEN;
            text = data.time;
         }
         addChild(ft);
         this.dianjiTxt = new FTextArea();
         with(this.dianjiTxt)
         {
            name = "dianji";
            defaultTextFormat = tf;
            if(data.weizhi == 1)
            {
               x = 89;
            }
            else if(data.weizhi == 2)
            {
               x = 125;
            }
            y = 2;
            width = 260;
            wordWrap = true;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.RED;
            if(data.dianji == 1)
            {
               bl = 1;
               htmlText = "<a href=\'event:" + bl + "\'><u>" + data.content + "</u></a>";
               fun = data.fun;
               tid = data.tid;
            }
            else if(data.dianji == 2)
            {
               bl = 2;
               htmlText = "<a href=\'event:" + bl + "\'><u>" + data.content + "</u></a>";
               tid = data.tid;
            }
            else if(data.dianji == 0)
            {
               bl = 0;
               htmlText = data.content;
            }
         }
         addChild(this.dianjiTxt);
         this._parent = data._parent;
         if(this.bl == 1 || this.bl == 2)
         {
            this.dianjiTxt.addEventListener(TextEvent.LINK,this.onMapClick);
         }
         _height = this.dianjiTxt.height;
      }
      
      private function onMapClick(param1:TextEvent) : void
      {
         if(this.bl == 1)
         {
            this.fun(this.tid);
         }
         else if(this.bl == 2)
         {
            MainCharSeachPathManager.mainCharWalk(this.tid);
         }
      }
   }
}

