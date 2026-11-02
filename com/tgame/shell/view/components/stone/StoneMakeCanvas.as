package com.tgame.shell.view.components.stone
{
   import com.fireice.checkBox.FCheckBox;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.shell.view.components.StonePanel;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.*;
   
   public class StoneMakeCanvas extends Sprite
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
      
      public function StoneMakeCanvas()
      {
         var ft:FTextArea;
         super();
         this.bg = new Bitmap();
         this.bg.name = "ui.stone.make.ui";
         addChild(this.bg);
         ft = new FTextArea();
         with(ft)
         {
            x = 10;
            y = 10;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            htmlText = "<textformat leading=\'0\'>" + LanResManager.getLanTextWords(this,"宝石合成说明",[StaticValue.BLUE_HTML],null) + "</textformat>";
         }
         addChild(ft);
         ft = new FTextArea();
         with(ft)
         {
            x = 72;
            y = 89;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(this,"合成结果");
         }
         addChild(ft);
         ft = new FTextArea();
         with(ft)
         {
            x = 108;
            y = 89;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(this,"合成成功");
         }
         addChild(ft);
         ft = new FTextArea();
         with(ft)
         {
            x = 162;
            y = 89;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("退返");
         }
         addChild(ft);
         ft = new FTextArea();
         with(ft)
         {
            x = 218;
            y = 89;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("剩余");
         }
         addChild(ft);
         ft = new FTextArea();
         with(ft)
         {
            x = 72;
            y = 159;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.GREEN;
            filters = StaticValue.filter;
            htmlText = "<textformat leading=\'0\'>" + LanResManager.getLanTextWords(this,"六品宝石为最高品级宝石",null,false) + "</textforamt>";
         }
         addChild(ft);
         ft = new FTextArea();
         with(ft)
         {
            x = 72;
            y = 208;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.RED;
            filters = StaticValue.filter;
            htmlText = "<textformat leading=\'0\'>" + LanResManager.getLanTextWords(this,"宝石合成需要真气",[StaticValue.WHITE_HTML],false) + "</textforamt>";
         }
         addChild(ft);
         this.bindText = new FLabel();
         addChild(this.bindText);
         this.bindText.x = 262;
         this.bindText.y = 202;
         this.bindText.textColor = StaticValue.WHITE;
         this.bindText.filters = StaticValue.filter;
         this.bindText.text = LanResManager.getLanCommonTextWords("非绑定");
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
         this.putBtn.label = LanResManager.getLanCommonTextWords("放入宝石");
         addChild(this.putBtn);
         this.putBtn.x = 8;
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
            text = "100";
         }
         addChild(this.zhenqi);
         this.probability = new FLabel();
         with(this.probability)
         {
            x = 170;
            y = 225;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = "100";
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
               if(this.putBtn.label == LanResManager.getLanCommonTextWords("取出宝石"))
               {
                  this.$parent.dispatchEvent(new BaseEvent(StonePanel.UI_STONE_PANEL_MAKE_GET_STONE));
               }
               else
               {
                  this.$parent.dispatchEvent(new BaseEvent(StonePanel.UI_STONE_PANEL_MAKE_PUT_STONE));
               }
               break;
            case this.startBtn:
               this.$parent.dispatchEvent(new BaseEvent(StonePanel.UI_STONE_PANEL_MAKE_START));
         }
      }
      
      private function onCheck(param1:MouseEvent) : void
      {
         this.$parent.dispatchEvent(new BaseEvent(StonePanel.UI_STONE_PANEL_MAKE_USE_BIND_STONE,"",this.checkBox.selectState));
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
            this.putBtn.label = LanResManager.getLanCommonTextWords("取出宝石");
         }
         else
         {
            this.putBtn.label = LanResManager.getLanCommonTextWords("放入宝石");
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
            }
            _loc2_++;
         }
      }
      
      public function setData(param1:int, param2:int) : void
      {
         this.zhenqi.text = param1.toString();
         this.probability.text = param2 + "%";
      }
      
      public function reset() : void
      {
         this.setStone();
         this.setResult([]);
         this.setData(0,0);
      }
      
      public function setBingStone(param1:Goods, param2:String, param3:Boolean) : void
      {
         if(Boolean(this.bindItem) && Boolean(this.bindItem.parent))
         {
            this.bindItem.parent.removeChild(this.bindItem);
         }
         if(!param1)
         {
            this.itemBg.visible = false;
            this.checkBox.visible = false;
            this.checkBox.selectState = false;
            this.bindText.visible = false;
            this.bindText.text = "";
         }
         else
         {
            this.bindItem = new ItemFace(param1);
            addChild(this.bindItem);
            this.bindItem.x = 264;
            this.bindItem.y = 224;
            this.itemBg.visible = true;
            this.checkBox.visible = true;
            this.bindText.visible = true;
            this.checkBox.text = param2;
         }
         if(param3)
         {
            this.bindText.text = LanResManager.getLanCommonTextWords("绑定");
         }
         else
         {
            this.bindText.text = LanResManager.getLanCommonTextWords("非绑定");
         }
      }
   }
}

