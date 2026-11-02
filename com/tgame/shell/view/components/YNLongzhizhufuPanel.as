package com.tgame.shell.view.components
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.ColorBar;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.common.vo.item.Goods;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   
   public class YNLongzhizhufuPanel extends FPanel
   {
      
      public static const UI_YN_LONGZHIZHUFU_BUY:String = "UI_YN_LONGZHIZHUFU_BUY";
      
      public static const UI_YN_LONGZHIZHUFU_LINGQU:String = "UI_YN_LONGZHIZHUFU_LINGQU";
      
      private var ft:FTextArea;
      
      private var cbar:ColorBar;
      
      private var bg:DisplayObject;
      
      private var ftDesc:FTextArea;
      
      private var sprRight:Sprite;
      
      private var sprLeft:Sprite;
      
      public function YNLongzhizhufuPanel()
      {
         super();
         skin = "panel_btn";
         width = 712;
         height = 635;
         titleText = LanResManager.getLanCommonTextWords("龙之祝福");
         dragAble = true;
         showCloseButton = true;
         this.init();
         addEventListener(FCloseEvent.CLOSE,this.onClose);
      }
      
      private function onClose(param1:FCloseEvent = null) : void
      {
         if(this.parent != null)
         {
            this.parent.removeChild(this);
         }
      }
      
      private function init() : void
      {
         this.bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/ynLongzhizhufu/bg.swf");
         this.bg.x = 10;
         this.bg.y = 2;
         addChild(this.bg);
         this.ft = new FTextArea();
         this.ft.x = 145;
         this.ft.y = 5;
         this.ft.htmlText = "<font size=\'14\'>" + LanResManager.getLanCommonTextWords("本周物品") + "</font>";
         this.ft.textColor = StaticValue.ORANGE;
         addChild(this.ft);
         this.ft = new FTextArea();
         this.ft.x = 45;
         this.ft.y = 22;
         this.ft.width = 280;
         this.ft.htmlText = LanResManager.getLanCommonTextWords("购买礼包积累点，可以兑换珍稀物品。祝各位好运。");
         this.ft.textColor = StaticValue.GREEN;
         addChild(this.ft);
         this.ft = new FTextArea();
         this.ft.x = 565;
         this.ft.y = 5;
         this.ft.htmlText = "<font size=\'14\'>" + LanResManager.getLanCommonTextWords("兑换积累") + "</font>";
         this.ft.textColor = StaticValue.ORANGE;
         addChild(this.ft);
         this.ft = new FTextArea();
         this.ft.x = 485;
         this.ft.y = 22;
         this.ft.width = 220;
         this.ft.htmlText = LanResManager.getLanCommonTextWords("达到积累值按照条件可以兑换珍稀物品");
         this.ft.textColor = StaticValue.GREEN;
         addChild(this.ft);
         this.ft = new FTextArea();
         this.ft.x = 75;
         this.ft.y = 473;
         this.ft.htmlText = "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("积累值") + "</font>";
         addChild(this.ft);
         this.ft = new FTextArea();
         this.ft.x = 70;
         this.ft.y = 515;
         this.ft.htmlText = LanResManager.getLanCommonTextWords("备注：");
         this.ft.textColor = StaticValue.GREEN;
         addChild(this.ft);
         this.ftDesc = new FTextArea();
         this.ftDesc.x = 110;
         this.ftDesc.y = 515;
         this.ftDesc.wordWrap = true;
         this.ftDesc.width = 570;
         this.ftDesc.textColor = StaticValue.GREEN;
         this.ftDesc.htmlText = LanResManager.getLanCommonTextWords("1、每个礼包可购买888次；2、只能用元宝购买；3、购买礼包获得积累值；4、每个奖励只能获得1次；5、礼包有时间限制。");
         addChild(this.ftDesc);
         this.cbar = new ColorBar(5,521,7,true);
         this.cbar.x = 145 + 3;
         this.cbar.y = 475 + 5;
         addChild(this.cbar);
         this.sprLeft = new Sprite();
         with(this.sprLeft.graphics)
         {
            beginFill(0,0.5);
            drawRect(0,0,315,405);
            endFill();
         }
         this.sprLeft.x = 18;
         this.sprLeft.y = 50;
         addChild(this.sprLeft);
         this.sprRight = new Sprite();
         with(this.sprRight.graphics)
         {
            beginFill(0,0.5);
            drawRect(0,0,210,420);
            endFill();
         }
         this.sprRight.x = 485;
         this.sprRight.y = 45;
         addChild(this.sprRight);
      }
      
      private function onClick1(param1:MouseEvent = null) : void
      {
         var _loc2_:String = param1.target.name;
         var _loc3_:Array = _loc2_.split(",");
         dispatchEvent(new BaseEvent(UI_YN_LONGZHIZHUFU_LINGQU,"",_loc3_));
      }
      
      private function onClick2(param1:MouseEvent = null) : void
      {
         dispatchEvent(new BaseEvent(UI_YN_LONGZHIZHUFU_BUY,"",param1.target.name));
      }
      
      public function setData(param1:Array, param2:Array, param3:int, param4:int) : void
      {
         var _loc6_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:Goods = null;
         var _loc10_:FTextArea = null;
         var _loc11_:DisplayObject = null;
         var _loc12_:ItemFace = null;
         var _loc13_:FTextArea = null;
         var _loc14_:SecondButton = null;
         var _loc15_:Bitmap = null;
         if(param3 >= param4)
         {
            param3 = param4;
         }
         this.cbar.setValue(param3,param4);
         while(this.sprLeft.numChildren > 0)
         {
            this.sprLeft.removeChildAt(0);
         }
         while(this.sprRight.numChildren > 0)
         {
            this.sprRight.removeChildAt(0);
         }
         var _loc5_:int = 0;
         _loc6_ = 0;
         while(_loc6_ < 3)
         {
            _loc8_ = 0;
            while(_loc8_ < 2)
            {
               _loc9_ = new Goods(param1[_loc5_].id);
               _loc10_ = new FTextArea();
               _loc10_.x = 52 + 160 * _loc8_;
               _loc10_.y = 1 + 135 * _loc6_;
               _loc10_.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + _loc9_.res.name + "</font>";
               this.sprLeft.addChild(_loc10_);
               _loc11_ = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/fuqijingji/bigkuang.swf");
               _loc11_.x = 43 + 160 * _loc8_;
               _loc11_.y = 17 + 137 * _loc6_;
               this.sprLeft.addChild(_loc11_);
               _loc12_ = new ItemFace(_loc9_,65,65);
               _loc12_.x = 45 + 160 * _loc8_;
               _loc12_.y = 19 + 137 * _loc6_;
               this.sprLeft.addChild(_loc12_);
               _loc13_ = new FTextArea();
               _loc13_.x = 45 + 160 * _loc8_;
               _loc13_.y = 85 + 135 * _loc6_;
               _loc13_.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + param1[_loc5_].price + LanResManager.getLanCommonTextWords("元宝/个") + "</font>";
               this.sprLeft.addChild(_loc13_);
               _loc14_ = new SecondButton();
               _loc14_.x = 55 + 160 * _loc8_;
               _loc14_.y = 103 + 135 * _loc6_;
               _loc14_.label = LanResManager.getLanCommonTextWords("购买");
               _loc14_.name = param1[_loc5_].id;
               this.sprLeft.addChild(_loc14_);
               _loc14_.addEventListener(MouseEvent.CLICK,this.onClick2);
               _loc5_++;
               _loc8_++;
            }
            _loc6_++;
         }
         var _loc7_:int = 0;
         _loc6_ = 0;
         while(_loc6_ < 4)
         {
            _loc10_ = new FTextArea();
            _loc10_.x = 50;
            _loc10_.y = 8 + 105 * _loc6_ - _loc6_;
            _loc10_.width = 170;
            _loc10_.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("积累值达到") + "</font><font color=\'" + StaticValue.YELLOW_HTML + "\'>" + param2[_loc7_].name + LanResManager.getLanCommonTextWords("元宝") + "</font><font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("获得：");
            this.sprRight.addChild(_loc10_);
            _loc8_ = 0;
            while(_loc8_ < 2)
            {
               _loc15_ = StaticValue.getBitmapByClassName("ui.tiem.slot");
               _loc15_.y = 32 + 103 * _loc6_;
               this.sprRight.addChild(_loc15_);
               _loc9_ = new Goods(param2[_loc7_].id);
               _loc12_ = new ItemFace(_loc9_);
               _loc12_.y = 34 + 103 * _loc6_;
               this.sprRight.addChild(_loc12_);
               _loc14_ = new SecondButton();
               _loc14_.y = 72 + 103 * _loc6_;
               _loc14_.label = LanResManager.getLanCommonTextWords("领取");
               _loc14_.name = param2[_loc7_].name + "," + param2[_loc7_].id;
               this.sprRight.addChild(_loc14_);
               _loc14_.addEventListener(MouseEvent.CLICK,this.onClick1);
               if(_loc8_ == 0)
               {
                  _loc15_.x = 58 + 45 * _loc8_;
                  _loc12_.x = 60 + 45 * _loc8_;
                  _loc14_.x = 48 + 45 * _loc8_;
               }
               else
               {
                  _loc15_.x = 72 + 45 * _loc8_;
                  _loc12_.x = 74 + 45 * _loc8_;
                  _loc14_.x = 68 + 45 * _loc8_;
               }
               if(int(param2[_loc7_].state) == 0)
               {
                  _loc14_.enabled = false;
                  _loc14_.label = LanResManager.getLanCommonTextWords("不可领灰");
               }
               else if(int(param2[_loc7_].state) == 1)
               {
                  _loc14_.enabled = true;
                  _loc14_.label = LanResManager.getLanCommonTextWords("可领取蓝");
               }
               else
               {
                  _loc14_.enabled = false;
                  _loc14_.label = LanResManager.getLanCommonTextWords("已领取");
               }
               _loc7_++;
               _loc8_++;
            }
            _loc6_++;
         }
      }
   }
}

