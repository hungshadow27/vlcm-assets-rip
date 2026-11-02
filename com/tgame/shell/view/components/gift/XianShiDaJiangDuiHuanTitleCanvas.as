package com.tgame.shell.view.components.gift
{
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.NewButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.shell.view.components.XianshiDajiangDuihuanPanel;
   import com.zcp.common.events.BaseEvent;
   import flash.display.DisplayObject;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.TextFormat;
   
   public class XianShiDaJiangDuiHuanTitleCanvas extends Sprite
   {
      
      private var _parent:DisplayObject;
      
      public var titleFt:FTextArea;
      
      public var btn:NewButton;
      
      public var Id:int;
      
      private var tf:TextFormat;
      
      private var shape:Shape;
      
      public var isNew:Boolean = false;
      
      public function XianShiDaJiangDuiHuanTitleCanvas()
      {
         super();
         this.tf = new TextFormat();
         this.tf.size = 12;
         this.btn = new NewButton();
         this.btn.textFormat = this.tf;
         this.btn.textColor = StaticValue.WHITE;
         this.btn.label = LanResManager.getLanCommonTextWords("点此领取");
         addChild(this.btn);
         this.btn.x = 0;
         this.btn.y = 0;
         this.btn.width = 130;
         this.btn.height = 32;
         this.btn.align = "left";
         this.btn.setXianshiHuodong();
         this.btn.setSkin("xianshiHuodongButton");
         this.btn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      public function set $parent(param1:DisplayObject) : void
      {
         this._parent = param1;
      }
      
      public function set isNewSystem(param1:Boolean) : void
      {
         if(param1)
         {
            if(!this.shape)
            {
               this.shape = new Shape();
               this.shape.graphics.beginFill(16711680);
               this.shape.graphics.drawCircle(0,0,3);
               this.shape.graphics.endFill();
               addChild(this.shape);
               this.shape.x = 115;
               this.shape.y = 3;
            }
         }
         else if(this.shape)
         {
            this.shape.parent.removeChild(this.shape);
            this.shape = null;
         }
         this.isNew = param1;
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.btn:
               this._parent.dispatchEvent(new BaseEvent(XianshiDajiangDuihuanPanel.UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_DUIHUAN_SHOW,"",this.Id));
               this.isNewSystem = false;
         }
      }
   }
}

