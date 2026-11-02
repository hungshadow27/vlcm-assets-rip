package com.tgame.shell.view.components.huizhangHecheng
{
   import com.fireice.checkBox.FCheckBox;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.Tools;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.shell.view.components.HuizhangDazaoHechengPanel;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.*;
   
   public class HuizhangHecheng extends Sprite
   {
      
      public var $parent:DisplayObject;
      
      public var bg:Bitmap;
      
      private var putBtn:SmallButton;
      
      private var resultContainer:Sprite;
      
      private var zhenqi:FLabel;
      
      private var probability:FLabel;
      
      private var startBtn:SecondButton;
      
      private var stone1:ItemFace;
      
      private var stone2:ItemFace;
      
      private var checkBox:FCheckBox;
      
      private var bindText:FLabel;
      
      private var itemBg:Bitmap;
      
      private var bindItem:ItemFace;
      
      private var slot1:Bitmap;
      
      private var slot2:Bitmap;
      
      private var slot3:Bitmap;
      
      private var ft:FTextArea;
      
      private var ft1:FTextArea;
      
      private var ft2:FTextArea;
      
      private var ft3:FTextArea;
      
      private var spr1:Sprite;
      
      public function HuizhangHecheng()
      {
         super();
         this.bg = new Bitmap();
         this.bg.name = "ui.jingyanheHecheng.ui";
         addChild(this.bg);
         this.ft1 = new FTextArea();
         with(this.ft1)
         {
            x = 3;
            y = 10;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            htmlText = "<textformat leading=\'0\'>" + LanResManager.getLanTextWords(this,"江湖徽章一级徽章打造石合成一级圣兽徽章一级圣兽徽章二级徽章打",[StaticValue.ORANGE_HTML,StaticValue.WHITE_HTML,StaticValue.GREEN_HTML,StaticValue.ORANGE_HTML,StaticValue.WHITE_HTML,StaticValue.GREEN_HTML,StaticValue.ORANGE_HTML,StaticValue.WHITE_HTML,StaticValue.GREEN_HTML,StaticValue.ORANGE_HTML,StaticValue.RED_HTML],false) + "</textformat>";
         }
         addChild(this.ft1);
         this.spr1 = new Sprite();
         addChild(this.spr1);
         this.ft = new FTextArea();
         with(this.ft)
         {
            x = 72;
            y = 89;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
         }
         this.spr1.addChild(this.ft);
         this.ft = new FTextArea();
         with(this.ft)
         {
            x = 108 - 14;
            y = 89;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("徽章打造石");
         }
         this.spr1.addChild(this.ft);
         this.slot1 = StaticValue.getBitmapByClassName("ui.tiem.slot");
         this.spr1.addChild(this.slot1);
         this.slot1.x = 107;
         this.slot1.y = 111;
         this.ft2 = new FTextArea();
         with(this.ft2)
         {
            x = 72;
            y = 159;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            htmlText = "<textformat leading=\'0\'>" + LanResManager.getLanCommonTextWords("徽章打造石：是合成各等级圣兽徽章和魔兽徽章的必备材料") + "</textformat>";
         }
         addChild(this.ft2);
         this.ft3 = new FTextArea();
         with(this.ft3)
         {
            x = 70;
            y = 208;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            htmlText = "<textformat leading=\'0\'>" + LanResManager.getLanTextWords(this,"合成成功率十级圣兽徽章一级徽章打造石合成一级魔兽徽章魔兽徽章",[StaticValue.WHITE_HTML,StaticValue.ORANGE_HTML,StaticValue.WHITE_HTML,StaticValue.GREEN_HTML]) + "</textformat>";
         }
         addChild(this.ft3);
         this.bindText = new FLabel();
         addChild(this.bindText);
         this.bindText.x = 262;
         this.bindText.y = 202;
         this.bindText.textColor = StaticValue.WHITE;
         this.bindText.filters = StaticValue.filter;
         this.itemBg = StaticValue.getBitmapByClassName("ui.tiem.slot");
         addChild(this.itemBg);
         this.itemBg.x = 262;
         this.itemBg.y = 222;
         this.itemBg.visible = false;
         this.checkBox = new FCheckBox();
         this.checkBox.border = true;
         this.checkBox.textColor = StaticValue.WHITE;
         addChild(this.checkBox);
         this.checkBox.x = 70;
         this.checkBox.y = 276;
         this.checkBox.visible = false;
         this.checkBox.addEventListener(MouseEvent.CLICK,this.onCheck);
         this.putBtn = new SmallButton();
         this.putBtn.label = LanResManager.getLanCommonTextWords("放入徽章");
         addChild(this.putBtn);
         this.putBtn.x = 3;
         this.putBtn.y = 89;
         this.putBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.resultContainer = new Sprite();
         addChild(this.resultContainer);
         this.resultContainer.x = 109;
         this.resultContainer.y = 113;
         this.zhenqi = new FLabel();
         with(this.zhenqi)
         {
            x = 188;
            y = 208;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
         }
         addChild(this.zhenqi);
         this.probability = new FLabel();
         with(this.probability)
         {
            x = 170;
            y = 225;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
         }
         addChild(this.probability);
         this.startBtn = new SecondButton();
         this.startBtn.label = LanResManager.getLanCommonTextWords("开始合成");
         addChild(this.startBtn);
         this.startBtn.x = (307 - this.startBtn.width) / 2;
         this.startBtn.y = 310;
         this.startBtn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.putBtn:
               if(this.putBtn.label == LanResManager.getLanCommonTextWords("取出徽章"))
               {
                  this.$parent.dispatchEvent(new BaseEvent(HuizhangDazaoHechengPanel.UI_STONE_PANEL_MAKE_GET_STONE_HUIZHANG));
               }
               else
               {
                  this.$parent.dispatchEvent(new BaseEvent(HuizhangDazaoHechengPanel.UI_STONE_PANEL_MAKE_PUT_STONE_HUIZHANG));
               }
               break;
            case this.startBtn:
               this.$parent.dispatchEvent(new BaseEvent(HuizhangDazaoHechengPanel.UI_STONE_PANEL_MAKE_START_HUIZHANG));
         }
      }
      
      private function onCheck(param1:MouseEvent) : void
      {
      }
      
      public function setStone(param1:Goods = null, param2:Goods = null) : void
      {
         if(Boolean(this.stone1) && Boolean(this.stone1.parent))
         {
            this.stone1.parent.removeChild(this.stone1);
         }
         if(param1)
         {
            this.stone1 = new ItemFace(param1);
            addChild(this.stone1);
            this.stone1.x = 17;
            this.stone1.y = 114;
            this.putBtn.label = LanResManager.getLanCommonTextWords("取出徽章");
         }
         else
         {
            this.putBtn.label = LanResManager.getLanCommonTextWords("放入徽章");
         }
         if(Boolean(this.stone2) && Boolean(this.stone2.parent))
         {
            this.stone2.parent.removeChild(this.stone2);
         }
         if(param2)
         {
            this.stone2 = new ItemFace(param2);
            addChild(this.stone2);
            this.stone2.x = 17;
            this.stone2.y = 256;
         }
      }
      
      public function setResult(param1:Array) : void
      {
         var _loc2_:int = 0;
         var _loc4_:ItemFace = null;
         while(this.resultContainer.numChildren > 0)
         {
            this.resultContainer.removeChildAt(0);
         }
         var _loc3_:int = int(param1.length);
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            if(param1[_loc2_])
            {
               _loc4_ = new ItemFace(param1[_loc2_] as Goods);
               this.resultContainer.addChild(_loc4_);
               _loc4_.x = _loc2_ * 55;
               if((param1[_loc2_] as Goods).count > 0)
               {
                  _loc4_.filters = [];
               }
               else
               {
                  _loc4_.filters = Tools.blackWhiteFilter;
               }
            }
            _loc2_++;
         }
      }
      
      public function setData(param1:int, param2:int) : void
      {
      }
      
      public function reset() : void
      {
         this.setStone();
         this.setResult([]);
         this.setData(0,0);
      }
      
      public function setBingStone(param1:Goods, param2:String, param3:Boolean) : void
      {
      }
   }
}

