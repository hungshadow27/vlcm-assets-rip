package com.tgame.shell.view.components.attribute
{
   import com.fireice.checkBox.FCheckBox;
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.SmallButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.vo.item.Goods;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   
   public class YuLingHeChengPanel extends FPanel
   {
      
      public static var YULING_HECHENG_FANGRU_CLICK:String = "YULING_HECHENG_FANGRU_CLICK";
      
      public static var YULING_HECHENG_QUCHU_CLICK:String = "YULING_HECHENG_QUCHU_CLICK";
      
      public static var YULING_HECHENG_CLICK:String = "YULING_HECHENG_CLICK";
      
      public static var YULING_HECHENG_HEBING_CLICK:String = "YULING_HECHENG_HEBING_CLICK";
      
      private var putBtn:SmallButton;
      
      private var startBtn:SmallButton;
      
      private var zhenqi:FTextArea;
      
      private var kuang:Bitmap;
      
      private var stone1:ItemFace;
      
      private var stone2:ItemFace;
      
      private var resultContainer:Sprite;
      
      public var check:FCheckBox;
      
      private var bindItem:ItemFace;
      
      private var itemBg:Bitmap;
      
      private var bindText:FTextArea;
      
      private var ft9:FTextArea;
      
      public var $parent:DisplayObject;
      
      public function YuLingHeChengPanel()
      {
         var _loc1_:FTextArea = null;
         var _loc2_:FTextArea = null;
         var _loc3_:FTextArea = null;
         var _loc5_:FTextArea = null;
         var _loc6_:FTextArea = null;
         var _loc7_:FTextArea = null;
         super();
         this.kuang = new Bitmap();
         this.kuang = StaticValue.getBitmapByClassName("ui.stone.make.ui");
         this.kuang.x = 10;
         this.kuang.y = 23;
         addChild(this.kuang);
         dragAble = true;
         this.skin = "panel_btn";
         this.showCloseButton = true;
         width = 327;
         height = 398;
         this.titleText = LanResManager.getLanCommonTextWords("羽灵合成");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         _loc1_ = new FTextArea();
         _loc1_.multiline = true;
         _loc1_.filters = StaticValue.filter;
         _loc1_.width = 100;
         _loc1_.height = 110;
         _loc1_.x = 20 - 3;
         _loc1_.y = 10 - 6;
         addChild(_loc1_);
         _loc1_.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("羽灵合成") + "</font>";
         _loc2_ = new FTextArea();
         _loc2_.multiline = true;
         _loc2_.filters = StaticValue.filter;
         _loc2_.width = 280;
         _loc2_.height = 160;
         _loc2_.x = 20;
         _loc2_.y = 30;
         addChild(_loc2_);
         _loc2_.htmlText = "<textformat leading=\'4\'><font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("请将您需要合成的羽灵放入羽灵框") + "<br>" + LanResManager.getLanCommonTextWords("每三颗同类低级羽灵可以合成一颗高级羽灵") + "<br></font><font color=\'" + StaticValue.BLUE_HTML + "\'>" + LanResManager.getLanCommonTextWords("合成成功则三颗低级羽灵消失，获得一颗高级羽灵") + "<br>" + LanResManager.getLanCommonTextWords("合成失败则回收两颗羽灵，退还一颗羽灵") + "</font></textformat>";
         _loc3_ = new FTextArea();
         _loc3_.multiline = true;
         _loc3_.filters = StaticValue.filter;
         _loc3_.width = 100;
         _loc3_.height = 110;
         _loc3_.x = 85;
         _loc3_.y = 115;
         addChild(_loc3_);
         _loc3_.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("合") + "<br>" + LanResManager.getLanCommonTextWords("成") + "<br>" + LanResManager.getLanCommonTextWords("结") + "<br>" + LanResManager.getLanCommonTextWords("果") + "</font>";
         var _loc4_:FTextArea = new FTextArea();
         _loc4_.multiline = true;
         _loc4_.filters = StaticValue.filter;
         _loc4_.width = 100;
         _loc4_.height = 110;
         _loc4_.x = 115;
         _loc4_.y = 115;
         addChild(_loc4_);
         _loc4_.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("成功") + "</font>";
         _loc5_ = new FTextArea();
         _loc5_.multiline = true;
         _loc5_.filters = StaticValue.filter;
         _loc5_.width = 100;
         _loc5_.height = 110;
         _loc5_.x = 175 + 1;
         _loc5_.y = 115;
         addChild(_loc5_);
         _loc5_.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("退还") + "</font>";
         _loc6_ = new FTextArea();
         _loc6_.multiline = true;
         _loc6_.filters = StaticValue.filter;
         _loc6_.width = 100;
         _loc6_.height = 110;
         _loc6_.x = 227 + 5;
         _loc6_.y = 115;
         addChild(_loc6_);
         _loc6_.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("剩余") + "</font>";
         _loc7_ = new FTextArea();
         _loc7_.multiline = true;
         _loc7_.filters = StaticValue.filter;
         _loc7_.width = 226;
         _loc7_.height = 110;
         _loc7_.x = 85;
         _loc7_.y = 185;
         addChild(_loc7_);
         _loc7_.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("八阶羽灵为最高阶的羽灵") + "<br>" + LanResManager.getLanCommonTextWords("羽灵用于提升羽翼属性") + "</font>";
         this.zhenqi = new FTextArea();
         this.zhenqi.multiline = true;
         this.zhenqi.filters = StaticValue.filter;
         this.zhenqi.width = 200;
         this.zhenqi.height = 110;
         this.zhenqi.x = 85;
         this.zhenqi.y = 235 - 2;
         addChild(this.zhenqi);
         var _loc8_:FTextArea = new FTextArea();
         _loc8_.multiline = true;
         _loc8_.filters = StaticValue.filter;
         _loc8_.width = 226;
         _loc8_.height = 110;
         _loc8_.x = 85;
         _loc8_.y = 267 - 2;
         addChild(_loc8_);
         _loc8_.htmlText = "<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("注意：本处合成为一次性批量合成") + "<br>" + LanResManager.getLanCommonTextWords("您可以将羽灵拆分后再放入进行部分合成") + "</font>";
         this.putBtn = new SmallButton();
         this.putBtn.label = LanResManager.getLanCommonTextWords("放入羽灵");
         addChild(this.putBtn);
         this.putBtn.x = 20 + 3;
         this.putBtn.y = 115 - 2;
         this.putBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.resultContainer = new Sprite();
         addChild(this.resultContainer);
         this.resultContainer.x = 109 + 10;
         this.resultContainer.y = 113 + 23;
         this.check = new FCheckBox();
         addChild(this.check);
         this.check.visible = false;
         this.check.x = 80 + 10 - 1 - 1 - 1;
         this.check.y = 300 + 13 - 10 - 1 - 1 - 2;
         this.check.addEventListener(MouseEvent.CLICK,this.onCheck);
         this.ft9 = new FTextArea();
         this.ft9.multiline = true;
         this.ft9.filters = StaticValue.filter;
         this.ft9.width = 226;
         this.ft9.height = 110;
         this.ft9.x = this.check.x + 20;
         this.ft9.y = this.check.y;
         addChild(this.ft9);
         this.ft9.visible = false;
         this.ft9.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("背包中同类的绑定羽灵同时参与合成") + "</font>";
         this.itemBg = StaticValue.getBitmapByClassName("ui.tiem.slot");
         addChild(this.itemBg);
         this.itemBg.x = 262 + 10;
         this.itemBg.y = 222 + 23 - 2;
         this.itemBg.visible = false;
         this.bindText = new FTextArea();
         this.bindText.multiline = true;
         this.bindText.filters = StaticValue.filter;
         this.bindText.width = 226;
         this.bindText.height = 110;
         this.bindText.x = 262 + 10;
         this.bindText.y = 202 + 23 - 2;
         addChild(this.bindText);
         this.bindText.visible = false;
         this.bindText.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("绑定") + "</font>";
         this.startBtn = new SmallButton();
         this.startBtn.label = LanResManager.getLanCommonTextWords("开始合成");
         addChild(this.startBtn);
         this.startBtn.x = 130;
         this.startBtn.y = 333;
         this.startBtn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function onClose(param1:FCloseEvent) : void
      {
         if(parent != null)
         {
            this.parent.removeChild(this);
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.putBtn:
               if(this.putBtn.label == LanResManager.getLanCommonTextWords("放入羽灵"))
               {
                  dispatchEvent(new BaseEvent(YULING_HECHENG_FANGRU_CLICK));
               }
               else
               {
                  dispatchEvent(new BaseEvent(YULING_HECHENG_QUCHU_CLICK));
               }
               break;
            case this.startBtn:
               dispatchEvent(new BaseEvent(YULING_HECHENG_CLICK));
         }
      }
      
      private function onCheck(param1:MouseEvent) : void
      {
         dispatchEvent(new BaseEvent(YULING_HECHENG_HEBING_CLICK,"",this.check.selectState));
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
            this.stone1.x = 17 + 10;
            this.stone1.y = 114 + 23;
            this.putBtn.label = LanResManager.getLanCommonTextWords("取出羽灵");
         }
         else
         {
            this.putBtn.label = LanResManager.getLanCommonTextWords("放入羽灵");
         }
         if(Boolean(this.stone2) && Boolean(this.stone2.parent))
         {
            this.stone2.parent.removeChild(this.stone2);
         }
         if(param2)
         {
            this.stone2 = new ItemFace(param2);
            addChild(this.stone2);
            this.stone2.x = 17 + 10;
            this.stone2.y = 256 + 23;
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
         this.zhenqi.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("本次合成需要真气：") + param1 + "<br>" + LanResManager.getLanCommonTextWords("本次合成成功率：") + param2 / 100 + "%</font>";
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
         this.ft9.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + param2 + "</font>";
         if(!param1)
         {
            this.itemBg.visible = false;
            this.check.visible = false;
            this.check.selectState = false;
            this.bindText.visible = false;
            this.bindText.text = "";
            this.ft9.visible = false;
         }
         else
         {
            this.bindItem = new ItemFace(param1);
            addChild(this.bindItem);
            this.bindItem.x = 264 + 10;
            this.bindItem.y = 224 + 23 - 2;
            this.itemBg.visible = true;
            this.check.visible = true;
            this.bindText.visible = true;
            this.ft9.visible = true;
         }
         if(param3)
         {
            this.bindText.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("绑定") + "</font>";
         }
         else
         {
            this.bindText.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("非绑定") + "</font>";
         }
      }
   }
}

