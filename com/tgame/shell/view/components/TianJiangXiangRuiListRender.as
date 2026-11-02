package com.tgame.shell.view.components
{
   import com.fireice.list.FListCellRenderer;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.*;
   import com.zcp.common.events.BaseEvent;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   import flash.text.TextFormat;
   
   public class TianJiangXiangRuiListRender extends FListCellRenderer
   {
      
      public static var $parent:DisplayObject;
      
      private var btn:SmallButton;
      
      public function TianJiangXiangRuiListRender()
      {
         super();
      }
      
      override public function initUI() : void
      {
         var tf:TextFormat;
         var ft:FTextArea;
         _height = 20;
         tf = new TextFormat();
         tf.align = "center";
         ft = new FTextArea();
         with(ft)
         {
            width = 80;
            height = 20;
            x = 8;
            y = 2;
            textColor = StaticValue.BLUE;
            htmlText = data.name;
            defaultTextFormat = tf;
         }
         addChild(ft);
         ft = new FTextArea();
         with(ft)
         {
            width = 100;
            height = 20;
            x = 100;
            y = 2;
            textColor = StaticValue.WHITE;
            htmlText = data.minGrade + "-" + data.maxGrade;
            defaultTextFormat = tf;
         }
         addChild(ft);
         this.btn = new SmallButton();
         this.btn.label = LanResManager.getLanCommonTextWords("传送");
         addChild(this.btn);
         this.btn.x = 180;
         this.btn.y = 2;
         this.btn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.btn:
               $parent.dispatchEvent(new BaseEvent(TianJiangXiangRuiPanel.TIANJIANGXIANGRUI_CHUANSHONG,"",data.id));
         }
      }
   }
}

