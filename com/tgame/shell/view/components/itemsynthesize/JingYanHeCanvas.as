package com.tgame.shell.view.components.itemsynthesize
{
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.shell.view.components.ItemSynthesizePanel;
   import com.tgame.shell.view.components.stone.*;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.*;
   
   public class JingYanHeCanvas extends Sprite
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
      
      private var itemBg:Bitmap;
      
      private var slot1:Bitmap;
      
      private var slot2:Bitmap;
      
      private var slot3:Bitmap;
      
      public function JingYanHeCanvas()
      {
         var ft:FTextArea;
         super();
         this.bg = new Bitmap();
         this.bg.name = "ui.jingyanheHecheng.ui";
         addChild(this.bg);
         ft = new FTextArea();
         with(ft)
         {
            x = 1;
            y = 5;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            htmlText = "<font color = \'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanTextWords(this,"经验盒合成说明") + "</font>";
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
            text = LanResManager.getLanTextWords(StoneMakeCanvas,"合成结果");
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
            text = LanResManager.getLanTextWords(StoneMakeCanvas,"合成成功");
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
         this.slot1 = StaticValue.getBitmapByClassName("ui.tiem.slot");
         this.slot2 = StaticValue.getBitmapByClassName("ui.tiem.slot");
         this.slot3 = StaticValue.getBitmapByClassName("ui.tiem.slot");
         addChild(this.slot1);
         this.slot1.x = 107;
         this.slot1.y = 111;
         addChild(this.slot2);
         this.slot2.x = 162;
         this.slot2.y = 111;
         addChild(this.slot3);
         this.slot3.x = 217;
         this.slot3.y = 111;
         ft = new FTextArea();
         with(ft)
         {
            x = 72;
            y = 159;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.GREEN;
            filters = StaticValue.filter;
            htmlText = "<font color = \'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanTextWords(this,"五品经验盒为最高经验盒经验盒可增加人物或者圣兽经验") + "</font>";
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
            htmlText = "<textformat leading=\'0\'>" + "<font color = \'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanTextWords(this,"本次合成需要铜币：本次合成成功率：注意：本处合成为一次性批量合成您可以将经验盒拆分后再进行部分合成") + "</font>" + "</textformat>";
         }
         addChild(ft);
         this.itemBg = StaticValue.getBitmapByClassName("ui.tiem.slot");
         addChild(this.itemBg);
         this.itemBg.x = 262;
         this.itemBg.y = 222;
         this.itemBg.visible = false;
         this.putBtn = new SmallButton();
         this.putBtn.label = LanResManager.getLanCommonTextWords("放入经验盒");
         addChild(this.putBtn);
         this.putBtn.x = 2;
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
            textColor = StaticValue.GREEN;
            filters = StaticValue.filter;
            text = "100";
         }
         addChild(this.zhenqi);
         this.probability = new FLabel();
         with(this.probability)
         {
            x = 170;
            y = 225;
            textColor = StaticValue.GREEN;
            filters = StaticValue.filter;
            text = "50%";
         }
         addChild(this.probability);
         this.startBtn = new SecondButton();
         this.startBtn.label = LanResManager.getLanCommonTextWords("开始合成");
         this.startBtn.enabled = false;
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
               if(this.putBtn.label == LanResManager.getLanCommonTextWords("取出经验盒"))
               {
                  this.$parent.dispatchEvent(new BaseEvent(ItemSynthesizePanel.UI_JINGYANHE_GETEQUIPBTN_CLICK));
               }
               else
               {
                  this.$parent.dispatchEvent(new BaseEvent(ItemSynthesizePanel.UI_JINGYANHE_SETEQUIPBTN_CLICK));
               }
               break;
            case this.startBtn:
               this.$parent.dispatchEvent(new BaseEvent(ItemSynthesizePanel.UI_JINGYANHE_STARTBTN_CLICK));
         }
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
            this.stone1.y = 113;
            this.putBtn.label = LanResManager.getLanCommonTextWords("取出经验盒");
            this.startBtn.enabled = true;
         }
         else
         {
            this.putBtn.label = LanResManager.getLanCommonTextWords("放入经验盒");
            this.startBtn.enabled = false;
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
            this.stone2.y = 255;
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
   }
}

