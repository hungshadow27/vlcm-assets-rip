package com.tgame.shell.view.components.attribute
{
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.Tools;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.*;
   import com.zcp.common.events.BaseEvent;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   import flash.text.*;
   
   public class OtherAttributeCanvas extends FCanvas
   {
      
      public static const UI_OTHERATTRIBUTE_CHENGZHAN_SHOP_OPEN:String = "UI_OTHERATTRIBUTE_CHENGZHAN_SHOP_OPEN";
      
      public static const UI_OTHERATTRIBUTE_KUAFU_SHOP_OPEN:String = "UI_OTHERATTRIBUTE_KUAFU_SHOP_OPEN";
      
      public var $parent:DisplayObject;
      
      private var content1:FTextArea;
      
      private var content2:FTextArea;
      
      private var content3:FTextArea;
      
      private var attribute:FTextArea;
      
      private var attribute1:FTextArea;
      
      private var attribute2:FTextArea;
      
      private var attribute22:FTextArea;
      
      private var attribute3:FTextArea;
      
      private var btn1:SecondButton;
      
      private var btn2:SecondButton;
      
      private var tipCanvas:FCanvas;
      
      private var tip:FTextArea;
      
      public function OtherAttributeCanvas(param1:Boolean = true)
      {
         var title:FLabel;
         var tips:FTextArea;
         var $enableClick:Boolean = param1;
         super();
         skin = "canvas1";
         width = 182 + 24;
         height = 364;
         graphics.beginFill(0,0.5);
         graphics.drawRect(0,0,182 + 24,360);
         graphics.endFill();
         this.tipCanvas = new FCanvas();
         this.tipCanvas.skin = "backGroud";
         this.tip = new FTextArea();
         with(this.tip)
         {
            x = 2;
            y = 2;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
         }
         this.tipCanvas.addChild(this.tip);
         title = new FLabel();
         title.textColor = StaticValue.ORANGE;
         title.filters = StaticValue.filter;
         title.x = 12 - 3;
         title.y = 12;
         addChild(title);
         title.text = LanResManager.getLanCommonTextWords("战纹属性");
         this.content1 = new FTextArea();
         this.content1.autoSize = TextFieldAutoSize.LEFT;
         this.content1.textColor = StaticValue.BLUE;
         this.content1.filters = StaticValue.filter;
         addChild(this.content1);
         this.content1.x = 12 - 3;
         this.content1.y = 27;
         this.content1.htmlText = "<textformat leading=\'2\'>" + LanResManager.getLanCommonTextWords("攻击增强比例") + "<br>" + LanResManager.getLanCommonTextWords("伤害反弹比例") + "<br>" + LanResManager.getLanCommonTextWords("忽视防御比例") + "<br>" + LanResManager.getLanCommonTextWords("伤害减免比例") + "</textformat>";
         this.content1.addEventListener(MouseEvent.MOUSE_OUT,this.onMouseTip1);
         this.content1.addEventListener(MouseEvent.MOUSE_OVER,this.onMouseTip1);
         this.attribute = new FTextArea();
         this.attribute.autoSize = TextFieldAutoSize.LEFT;
         this.attribute.textColor = StaticValue.WHITE;
         this.attribute.filters = StaticValue.filter;
         addChild(this.attribute);
         this.attribute.x = 106;
         this.attribute.y = 27;
         this.attribute1 = new FTextArea();
         this.attribute1.autoSize = TextFieldAutoSize.LEFT;
         this.attribute1.textColor = StaticValue.GREEN;
         this.attribute1.filters = StaticValue.filter;
         addChild(this.attribute1);
         this.attribute1.x = 140;
         this.attribute1.y = 27;
         title = new FLabel();
         title.textColor = StaticValue.ORANGE;
         title.filters = StaticValue.filter;
         title.x = 15 - 6;
         title.y = this.content1.y + this.content1.height + 3;
         addChild(title);
         title.text = LanResManager.getLanCommonTextWords("抵抗加成");
         this.content2 = new FTextArea();
         this.content2.autoSize = TextFieldAutoSize.LEFT;
         this.content2.textColor = StaticValue.BLUE;
         this.content2.filters = StaticValue.filter;
         addChild(this.content2);
         this.content2.x = 12 - 3;
         this.content2.y = title.y + 13;
         this.content2.htmlText = "<textformat leading=\'2\'>" + LanResManager.getLanCommonTextWords("爆击伤害减免比例") + "<br>" + LanResManager.getLanCommonTextWords("暗器伤害减免比例") + "<br>" + LanResManager.getLanCommonTextWords("抵抗对方暗器几率") + "<br>" + LanResManager.getLanCommonTextWords("抵抗对方弓箭几率") + "<br>" + LanResManager.getLanCommonTextWords("抵抗丹田武学几率") + "</textformat>";
         this.content2.addEventListener(MouseEvent.MOUSE_OUT,this.onMouseTip2);
         this.content2.addEventListener(MouseEvent.MOUSE_OVER,this.onMouseTip2);
         this.attribute2 = new FTextArea();
         this.attribute2.autoSize = TextFieldAutoSize.LEFT;
         this.attribute2.textColor = StaticValue.WHITE;
         this.attribute2.filters = StaticValue.filter;
         addChild(this.attribute2);
         this.attribute2.x = 113;
         this.attribute2.y = this.content2.y;
         this.attribute22 = new FTextArea();
         this.attribute22.autoSize = TextFieldAutoSize.LEFT;
         this.attribute22.textColor = StaticValue.GREEN;
         this.attribute22.filters = StaticValue.filter;
         addChild(this.attribute22);
         this.attribute22.x = 120 + 20;
         this.attribute22.y = this.content2.y;
         title = new FLabel();
         title.textColor = StaticValue.ORANGE;
         title.filters = StaticValue.filter;
         title.x = 15 - 6;
         title.y = this.content2.y + this.content2.height + 2;
         addChild(title);
         title.text = LanResManager.getLanCommonTextWords("拥有声望点数");
         this.content3 = new FTextArea();
         this.content3.autoSize = TextFieldAutoSize.LEFT;
         this.content3.textColor = StaticValue.BLUE;
         this.content3.filters = StaticValue.filter;
         addChild(this.content3);
         this.content3.x = 12 - 3;
         this.content3.y = title.y + 15;
         this.content3.htmlText = "<textformat leading=\'\'>" + LanResManager.getLanCommonTextWords("襄阳城战声望") + "<br>" + LanResManager.getLanCommonTextWords("跨服论剑声望") + "<br>" + LanResManager.getLanCommonTextWords("夫妻竞技声望") + "</textformat>";
         this.content3.addEventListener(MouseEvent.MOUSE_OUT,this.onMouseTip3);
         this.content3.addEventListener(MouseEvent.MOUSE_OVER,this.onMouseTip3);
         this.attribute3 = new FTextArea();
         this.attribute3.autoSize = TextFieldAutoSize.LEFT;
         this.attribute3.textColor = StaticValue.WHITE;
         this.attribute3.filters = StaticValue.filter;
         addChild(this.attribute3);
         this.attribute3.x = 158 - 23;
         this.attribute3.y = this.content3.y;
         tips = new FTextArea();
         tips.width = 172;
         tips.height = 35;
         tips.defaultTextFormat = StaticValue.format;
         tips.textColor = StaticValue.RED;
         tips.filters = StaticValue.filter;
         tips.y = this.content3.y + this.content3.height;
         tips.htmlText = "<textformat leading=\'0.5\'>" + LanResManager.getLanCommonTextWords("声望每周一0:00清空") + "<br>" + LanResManager.getLanCommonTextWords("请及时使用点数购物") + "</textformat>";
         this.btn1 = new SecondButton();
         this.btn1.label = LanResManager.getLanCommonTextWords("城战声望商店");
         this.btn1.enabled = $enableClick;
         addChild(this.btn1);
         this.btn1.x = 9;
         this.btn1.y = 305;
         this.btn1.addEventListener(MouseEvent.CLICK,this.onClick);
         this.btn2 = new SecondButton();
         this.btn2.label = LanResManager.getLanCommonTextWords("论剑声望商店");
         this.btn2.enabled = $enableClick;
         addChild(this.btn2);
         this.btn2.x = 102;
         this.btn2.y = 305;
         this.btn2.addEventListener(MouseEvent.CLICK,this.onClick);
         tips = new FTextArea();
         tips.width = 172;
         tips.height = 20;
         tips.defaultTextFormat = StaticValue.format;
         tips.textColor = StaticValue.GREEN;
         tips.filters = StaticValue.filter;
         addChild(tips);
         tips.x = 0;
         tips.y = 330;
         tips.text = LanResManager.getLanCommonTextWords("鼠标放到属性上可查看注解");
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.btn1:
               this.$parent.dispatchEvent(new BaseEvent(UI_OTHERATTRIBUTE_CHENGZHAN_SHOP_OPEN));
               break;
            case this.btn2:
               this.$parent.dispatchEvent(new BaseEvent(UI_OTHERATTRIBUTE_KUAFU_SHOP_OPEN));
         }
      }
      
      private function onMouseTip1(param1:MouseEvent) : void
      {
         var _loc2_:String = null;
         var _loc3_:String = null;
         var _loc4_:String = null;
         var _loc5_:String = null;
         var _loc6_:int = 0;
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               this.content1.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTip1);
               break;
            case MouseEvent.MOUSE_MOVE:
               _loc2_ = LanResManager.getLanCommonTextWords("攻击增强比例");
               _loc3_ = LanResManager.getLanCommonTextWords("伤害反弹比例");
               _loc4_ = LanResManager.getLanCommonTextWords("忽视防御比例");
               _loc5_ = LanResManager.getLanCommonTextWords("伤害减免比例");
               _loc6_ = this.content1.getCharIndexAtPoint(this.content1.mouseX,this.content1.mouseY);
               if(_loc6_ >= this.content1.text.indexOf(_loc2_) && _loc6_ <= this.content1.text.indexOf(_loc2_) + _loc2_.length - 1)
               {
                  this.showTip(LanResManager.getLanTextWords(this,"攻击增强比例提示",[StaticValue.RED_HTML,StaticValue.GREEN_STRONG_HTML,StaticValue.YELLOW_HTML]));
               }
               else if(_loc6_ >= this.content1.text.indexOf(_loc3_) && _loc6_ <= this.content1.text.indexOf(_loc3_) + _loc3_.length - 1)
               {
                  this.showTip(LanResManager.getLanTextWords(this,"伤害反弹比例提示",[StaticValue.RED_HTML,StaticValue.GREEN_STRONG_HTML,StaticValue.YELLOW_HTML]));
               }
               else if(_loc6_ >= this.content1.text.indexOf(_loc4_) && _loc6_ <= this.content1.text.indexOf(_loc4_) + _loc4_.length - 1)
               {
                  this.showTip(LanResManager.getLanTextWords(this,"忽视防御比例提示",[StaticValue.RED_HTML,StaticValue.GREEN_STRONG_HTML,StaticValue.YELLOW_HTML]));
               }
               else if(_loc6_ >= this.content1.text.indexOf(_loc5_) && _loc6_ <= this.content1.text.indexOf(_loc5_) + _loc5_.length - 1)
               {
                  this.showTip(LanResManager.getLanTextWords(this,"伤害减免比例提示",[StaticValue.RED_HTML,StaticValue.GREEN_STRONG_HTML,StaticValue.YELLOW_HTML]));
               }
               else if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
               break;
            case MouseEvent.MOUSE_OUT:
               if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
               this.content1.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTip1);
         }
      }
      
      private function onMouseTip2(param1:MouseEvent) : void
      {
         var _loc2_:String = null;
         var _loc3_:String = null;
         var _loc4_:String = null;
         var _loc5_:String = null;
         var _loc6_:String = null;
         var _loc7_:int = 0;
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               this.content2.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTip2);
               break;
            case MouseEvent.MOUSE_MOVE:
               _loc2_ = LanResManager.getLanCommonTextWords("爆击伤害减免比例");
               _loc3_ = LanResManager.getLanCommonTextWords("暗器伤害减免比例");
               _loc4_ = LanResManager.getLanCommonTextWords("抵抗对方暗器几率");
               _loc5_ = LanResManager.getLanCommonTextWords("抵抗对方弓箭几率");
               _loc6_ = LanResManager.getLanCommonTextWords("抵抗丹田武学几率");
               _loc7_ = this.content2.getCharIndexAtPoint(this.content2.mouseX,this.content2.mouseY);
               if(_loc7_ >= this.content2.text.indexOf(_loc2_) && _loc7_ <= this.content2.text.indexOf(_loc2_) + _loc2_.length - 1)
               {
                  this.showTip(LanResManager.getLanTextWords(this,"爆击伤害减免比例提示"));
               }
               else if(_loc7_ >= this.content2.text.indexOf(_loc3_) && _loc7_ <= this.content2.text.indexOf(_loc3_) + _loc3_.length - 1)
               {
                  this.showTip(LanResManager.getLanTextWords(this,"暗器伤害减免比例提示"));
               }
               else if(_loc7_ >= this.content2.text.indexOf(_loc4_) && _loc7_ <= this.content2.text.indexOf(_loc4_) + _loc4_.length - 1)
               {
                  this.showTip(LanResManager.getLanTextWords(this,"抵抗对方暗器几率提示"));
               }
               else if(_loc7_ >= this.content2.text.indexOf(_loc5_) && _loc7_ <= this.content2.text.indexOf(_loc5_) + _loc5_.length - 1)
               {
                  this.showTip(LanResManager.getLanTextWords(this,"抵抗对方弓箭几率提示"));
               }
               else if(_loc7_ >= this.content2.text.indexOf(_loc6_) && _loc7_ <= this.content2.text.indexOf(_loc6_) + _loc6_.length - 1)
               {
                  this.showTip(LanResManager.getLanTextWords(this,"抵抗丹田武学几率"));
               }
               else if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
               break;
            case MouseEvent.MOUSE_OUT:
               if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
               this.content2.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTip2);
         }
      }
      
      private function onMouseTip3(param1:MouseEvent) : void
      {
         var _loc2_:String = null;
         var _loc3_:String = null;
         var _loc4_:String = null;
         var _loc5_:String = null;
         var _loc6_:int = 0;
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               this.content3.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTip3);
               break;
            case MouseEvent.MOUSE_MOVE:
               _loc2_ = LanResManager.getLanCommonTextWords("襄阳城战声望");
               _loc3_ = LanResManager.getLanCommonTextWords("跨服论剑声望");
               _loc4_ = "";
               _loc5_ = "";
               _loc6_ = this.content3.getCharIndexAtPoint(this.content3.mouseX,this.content3.mouseY);
               if(_loc6_ >= this.content3.text.indexOf(_loc2_) && _loc6_ <= this.content3.text.indexOf(_loc2_) + _loc2_.length - 1)
               {
                  this.showTip(LanResManager.getLanTextWords(this,"襄阳城战声望提示",[StaticValue.WHITE_HTML,StaticValue.RED_HTML]));
               }
               else if(_loc6_ >= this.content3.text.indexOf(_loc3_) && _loc6_ <= this.content3.text.indexOf(_loc3_) + _loc3_.length - 1)
               {
                  this.showTip(LanResManager.getLanTextWords(this,"跨服论剑声望提示",[StaticValue.WHITE_HTML,StaticValue.RED_HTML]));
               }
               else if(_loc6_ >= this.content3.text.indexOf(_loc4_) && _loc6_ <= this.content3.text.indexOf(_loc4_) + _loc4_.length - 1)
               {
                  _loc2_ = "<font color=\'" + StaticValue.WHITE_HTML + "\'>您在夫妻竞技中通过战斗所积累的夫妻竞技声望可参与夫妻竞技排行榜</font>";
                  this.showTip(_loc2_);
               }
               else if(_loc6_ >= this.content3.text.indexOf(_loc5_) && _loc6_ <= this.content3.text.indexOf(_loc5_) + _loc5_.length - 1)
               {
                  _loc2_ = "<font color=\'" + StaticValue.WHITE_HTML + "\'>拥有至尊VIP卡的玩家，击杀等级大于150的玩家可获得1点功勋值，功勋值可参与至尊功勋榜排名。击杀同一对手，一天最多可获得10点功勋。</font>";
                  this.showTip(_loc2_);
               }
               else if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
               break;
            case MouseEvent.MOUSE_OUT:
               if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
               this.content3.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTip3);
         }
      }
      
      private function showTip(param1:String) : void
      {
         this.tip.htmlText = param1;
         Tools.currentStage.addChild(this.tipCanvas);
         this.tipCanvas.width = this.tip.width + 4;
         this.tipCanvas.height = this.tip.height + 4;
         this.tipCanvas.x = Tools.currentStage.mouseX + 15;
         this.tipCanvas.y = Tools.currentStage.mouseY + 25;
      }
      
      public function setZanWen(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int, param8:int) : void
      {
         this.attribute.htmlText = "<textformat leading=\'2\'>" + (param1 > 0 ? "+" + param1 + "%" : "") + "<br>" + (param3 > 0 ? "+" + param3 + "%" : "") + "<br>" + (param5 > 0 ? "+" + param5 + "%" : "") + "<br>" + (param7 > 0 ? "+" + param7 + "%" : "") + "<br>" + "</textformat>";
         this.attribute1.htmlText = "<textformat leading=\'2\'>" + (param2 > 0 ? "+" + param2 + "%" : "") + "<br>" + (param4 > 0 ? "+" + param4 + "%" : "") + "<br>" + (param6 > 0 ? "+" + param6 + "%" : "") + "<br>" + (param8 > 0 ? "+" + param8 + "%" : "") + "<br>" + "</textformat>";
      }
      
      public function set9JIanJiaCheng(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number, param7:Number, param8:Number, param9:Number, param10:Number) : void
      {
         this.attribute2.htmlText = "<textformat leading=\'2\'>" + param1 + "%<br>" + param2 + "%<br>" + param3 + "%<br>" + param4 + "%<br>" + param5 + "%<br>" + "</textformat>";
         this.attribute22.htmlText = "<textformat leading=\'2\'>" + (param6 > 0 ? "+" + param6 / 100 + "%" : "") + "<br>" + (param7 > 0 ? "+" + param7 / 100 + "%" : "") + "<br>" + (param8 > 0 ? "+" + param8 / 100 + "%" : "") + "<br>" + (param9 > 0 ? "+" + param9 / 100 + "%" : "") + "<br>" + (param10 > 0 ? "+" + param10 / 100 + "%" : "") + "<br>" + "</textformat>";
      }
      
      public function setShengWang(param1:int, param2:int, param3:int, param4:int, param5:int) : void
      {
         this.attribute3.htmlText = "<textformat leading=\'\'>" + param1 + "<br>" + param2 + "<br>" + param3 + "</textformat>";
      }
   }
}

