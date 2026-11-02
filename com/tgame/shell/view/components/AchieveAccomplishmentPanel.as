package com.tgame.shell.view.components
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.list.FList;
   import com.fireice.panel.FCanvas;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FLabel;
   import com.fireice.util.FLoader;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.TextFormat;
   
   public class AchieveAccomplishmentPanel extends FPanel
   {
      
      public static const UI_QIYONGCHENGHAO_CLICK:String = "UI_QIYONGCHENGHAO_CLICK";
      
      private var listContainer2:Sprite;
      
      private var selectList2:FList;
      
      private var CjBar:ColorBar;
      
      private var Fname:FLabel;
      
      private var lb:FLabel;
      
      private var cjmb:FLabel;
      
      private var cjds:FLabel;
      
      private var jlch:FLabel;
      
      private var tsjl:FLabel;
      
      private var Displayobj:DisplayObject;
      
      private var QychBtn:SmallButton;
      
      private var chId:int;
      
      public function AchieveAccomplishmentPanel()
      {
         var img:Bitmap;
         var tf:TextFormat;
         var tColor:int;
         var faa:FCanvas = null;
         super();
         dragAble = true;
         this.skin = "sceondPanel";
         this.showCloseButton = true;
         width = 450;
         height = 135;
         this.titleText = LanResManager.getLanCommonTextWords("达成新成就");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         faa = new FCanvas();
         faa.x = 6;
         faa.y = 2;
         faa.skin = "box_transparence";
         faa.width = 438;
         faa.height = 101;
         addChild(faa);
         img = StaticValue.getBitmapByClassName("ui.char.attribute.accomplishment.bg.bar");
         addChild(img);
         img.x = 6;
         img.y = 2;
         tf = new TextFormat();
         tf.align = "left";
         img = StaticValue.getBitmapByClassName("ui.char.attribute.accomplishment.colorBar.bg");
         addChild(img);
         img.x = 316;
         img.y = 4;
         tColor = StaticValue.GREEN_STRONG;
         this.Fname = new FLabel();
         with(this.Fname)
         {
            x = 86;
            y = 6;
            filters = StaticValue.filter;
            textColor = tColor;
            text = "";
         }
         addChild(this.Fname);
         img = StaticValue.getBitmapByClassName("ui.char.attribute.accomplishment.slot.big");
         addChild(img);
         img.x = 16;
         img.y = 27;
         this.lb = new FLabel();
         with(this.lb)
         {
            x = 101;
            y = 37;
            textColor = tColor;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(this,"成就目标");
         }
         addChild(this.lb);
         this.cjmb = new FLabel();
         with(this.cjmb)
         {
            x = 163;
            y = 37;
            textColor = tColor;
            filters = StaticValue.filter;
            text = "";
         }
         addChild(this.cjmb);
         this.lb = new FLabel();
         with(this.lb)
         {
            x = 101;
            y = 54;
            textColor = tColor;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(this,"成就点数");
         }
         addChild(this.lb);
         this.cjds = new FLabel();
         with(this.cjds)
         {
            x = 163;
            y = 54;
            textColor = tColor;
            filters = StaticValue.filter;
            text = "";
         }
         addChild(this.cjds);
         this.lb = new FLabel();
         with(this.lb)
         {
            x = 256;
            y = 54;
            textColor = tColor;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(this,"奖励称号");
         }
         addChild(this.lb);
         this.jlch = new FLabel();
         with(this.jlch)
         {
            x = 318;
            y = 54;
            textColor = tColor;
            filters = StaticValue.filter;
            text = "";
         }
         addChild(this.jlch);
         this.QychBtn = new SmallButton();
         this.QychBtn.label = LanResManager.getLanCommonTextWords("启用称号");
         addChild(this.QychBtn);
         this.QychBtn.x = 385;
         this.QychBtn.y = 25;
         this.QychBtn.addEventListener(MouseEvent.MOUSE_UP,this.onClick);
         this.lb = new FLabel();
         with(this.lb)
         {
            x = 101;
            y = 71;
            textColor = tColor;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(this,"特殊奖励");
         }
         addChild(this.lb);
         this.tsjl = new FLabel();
         with(this.tsjl)
         {
            x = 163;
            y = 71;
            textColor = tColor;
            filters = StaticValue.filter;
            text = "";
         }
         addChild(this.tsjl);
      }
      
      private function onClose(param1:FCloseEvent) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.QychBtn:
               dispatchEvent(new BaseEvent(UI_QIYONGCHENGHAO_CLICK,"",this.chId));
               this.QychBtn.enabled = false;
         }
      }
      
      public function SetInitializeContent(param1:Array) : void
      {
         var _loc2_:Bitmap = null;
         if(param1.length == 1)
         {
            this.Fname.text = param1[0].name;
            this.cjmb.text = param1[0].cjmb;
            this.cjds.text = param1[0].cjds;
            this.jlch.text = param1[0].jlch;
            this.tsjl.text = param1[0].tsjl;
            this.chId = param1[0].id;
            this.CjBar = new ColorBar(5,95,11);
            addChild(this.CjBar);
            this.CjBar.x = 331;
            this.CjBar.y = 7;
            this.CjBar.setValue(param1[0].CjNow,param1[0].CjMax);
            if(Boolean(this.Displayobj) && Boolean(this.Displayobj.parent))
            {
               this.Displayobj.parent.removeChild(this.Displayobj);
            }
            this.Displayobj = FLoader.startLoad(param1[0].icoPath,65,65);
            addChild(this.Displayobj);
            this.Displayobj.x = 18;
            this.Displayobj.y = 29;
            if(param1[0].CjNow == param1[0].CjMax)
            {
               _loc2_ = StaticValue.getBitmapByClassName("ui.char.attribute.accomplishment.complete");
               addChild(_loc2_);
               _loc2_.x = 166;
               _loc2_.y = 25;
            }
            this.QychBtn.enabled = true;
         }
      }
   }
}

