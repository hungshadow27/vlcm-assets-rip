package com.tgame.shell.view.components.attribute
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.fireice.text.FTextInput;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.SmallButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.common.vo.item.Goods;
   import com.zcp.common.events.BaseEvent;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.TextFormat;
   
   public class XiaoZhuKuaiPaoPanel extends FPanel
   {
      
      public static const UI_XIAOZHUKUAIPAO_GETJIANGLI:String = "UI_XIAOZHUKUAIPAO_GETJIANGLI";
      
      private var tf:TextFormat;
      
      private var bg:DisplayObject;
      
      private var wb:FTextArea;
      
      private var str:String = "";
      
      private var zuihou:FTextArea;
      
      private var zongZongzi:FTextArea;
      
      private var tijiaoZongzi:FTextArea;
      
      private var shuliangText:FTextInput;
      
      private var jiangliSpr:Sprite;
      
      private var xiaozhutfArr:Array = [];
      
      private var jianglitfArr:Array = [];
      
      private var xiaozhuBtnArr:Array = [];
      
      private var jiangliBtnArr:Array = [];
      
      public function XiaoZhuKuaiPaoPanel()
      {
         var _loc1_:FTextArea = null;
         super();
         this.titleText = LanResManager.getLanCommonTextWords("小猪快跑");
         this.showCloseButton = true;
         this.skin = "panel";
         this.dragAble = true;
         width = 998;
         height = 498;
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/xiaozhukuaipao/bg.swf");
         this.bg.x = 10;
         this.bg.y = 2;
         addChild(this.bg);
         this.jiangliSpr = new Sprite();
         this.jiangliSpr.x = 80;
         this.jiangliSpr.y = 220;
         addChild(this.jiangliSpr);
         this.str += "<textformat leading=\'6\'>";
         this.str += "<font color=\'StaticValue.GREEN\'>" + LanResManager.getLanCommonTextWords("活动时间：永久") + "<br>" + LanResManager.getLanCommonTextWords("活动内容：襄阳城主在牛家村购买了一批小猪，在途中不幸逃脱，所有玩家可在牛家村所有线,坐标为") + "<font color=\'#ff0000\'>" + "（125:41）（124:88）" + "</font>" + LanResManager.getLanCommonTextWords("击杀小猪");
         this.str += "</textformat>";
         this.wb = new FTextArea();
         this.wb.x = 85;
         this.wb.y = 85;
         this.wb.textColor = StaticValue.GREEN;
         this.wb.width = 738;
         this.wb.height = 82;
         this.wb.htmlText = this.str;
         addChild(this.wb);
         _loc1_ = new FTextArea();
         _loc1_.x = 480;
         _loc1_.y = 190;
         _loc1_.textColor = StaticValue.GREEN;
         _loc1_.width = 375;
         _loc1_.height = 30;
         _loc1_.htmlText = "<font size=\'20\'>" + LanResManager.getLanCommonTextWords("活动奖励") + "</font>";
         addChild(_loc1_);
      }
      
      public function upData(param1:Array, param2:Array) : void
      {
         var _loc3_:int = 0;
         var _loc4_:FTextArea = null;
         var _loc5_:String = null;
         var _loc6_:SmallButton = null;
         var _loc7_:Goods = null;
         var _loc8_:Array = null;
         var _loc9_:String = null;
         var _loc10_:int = 0;
         var _loc11_:Array = null;
         var _loc12_:String = null;
         var _loc13_:int = 0;
         var _loc14_:Object = null;
         while(this.jiangliSpr.numChildren > 0)
         {
            this.jiangliSpr.removeChildAt(0);
         }
         _loc3_ = 0;
         while(_loc3_ < param1.length)
         {
            _loc4_ = new FTextArea();
            _loc5_ = "<textformat leading=\'6\'>" + LanResManager.getLanCommonTextWords("活动期间，每日击杀小猪数量达到") + param1[_loc3_].shuliang + LanResManager.getLanCommonTextWords("可免费领取") + "  <font color=\'#ff9912\'>" + new Goods(param1[_loc3_].id).res.name + "  X" + param1[_loc3_].jiangliShuLiang + "</font>";
            _loc4_.x = 0;
            _loc4_.y = 30 * _loc3_;
            _loc4_.textColor = StaticValue.GREEN;
            _loc4_.width = 375;
            _loc4_.height = 30;
            _loc4_.htmlText = _loc5_;
            this.jiangliSpr.addChild(_loc4_);
            this.xiaozhutfArr.push(_loc4_);
            _loc6_ = new SmallButton();
            _loc6_.name = "xiaozhu" + _loc3_;
            _loc6_.label = LanResManager.getLanCommonTextWords("领取");
            _loc6_.x = _loc4_.x + _loc4_.width;
            _loc6_.y = _loc4_.y;
            _loc6_.enabled = param1[_loc3_].isLingqu;
            _loc6_.addEventListener(MouseEvent.CLICK,this.onClick);
            this.jiangliSpr.addChild(_loc6_);
            this.xiaozhuBtnArr.push(_loc6_);
            _loc3_++;
         }
         _loc3_ = 0;
         while(_loc3_ < param2.length)
         {
            _loc4_ = new FTextArea();
            _loc7_ = new Goods(param2[_loc3_].id);
            _loc8_ = param2[_loc3_].needArr as Array;
            _loc9_ = "";
            _loc10_ = 0;
            while(_loc10_ < _loc8_.length)
            {
               _loc14_ = _loc8_[_loc10_];
               if(_loc10_ > 0)
               {
                  _loc9_ += "+";
               }
               _loc9_ += new Goods(int(_loc14_.id)).res.name + " * " + _loc14_.jiangliShuLiang;
               _loc10_++;
            }
            _loc11_ = param2[_loc3_].jiangliArr as Array;
            _loc12_ = "  <font color=\'#ff9912\'>";
            _loc13_ = 0;
            while(_loc13_ < _loc11_.length)
            {
               _loc14_ = _loc11_[_loc13_];
               if(_loc13_ > 0)
               {
                  _loc12_ += "+";
               }
               _loc12_ += new Goods(int(_loc14_.xiaozhuid)).res.name + " * " + _loc14_.shuliang;
               _loc13_++;
            }
            _loc12_ += "</font>";
            _loc5_ = "<textformat leading=\'1\'>" + LanResManager.getLanCommonTextWords("集齐") + " " + _loc9_ + " " + LanResManager.getLanCommonTextWords("兑换") + _loc12_ + "</textformat>";
            _loc4_.x = 442;
            _loc4_.y = 30 * _loc3_;
            _loc4_.textColor = StaticValue.GREEN;
            _loc4_.width = 420;
            _loc4_.height = 30;
            _loc4_.htmlText = _loc5_;
            this.jiangliSpr.addChild(_loc4_);
            this.xiaozhutfArr.push(_loc4_);
            _loc6_ = new SmallButton();
            _loc6_.name = "jiangli" + _loc3_;
            _loc6_.label = LanResManager.getLanCommonTextWords("领取");
            _loc6_.x = _loc4_.x + _loc4_.width;
            _loc6_.y = _loc4_.y;
            _loc6_.enabled = param2[_loc3_].isLingqu;
            _loc6_.addEventListener(MouseEvent.CLICK,this.onClick);
            this.jiangliSpr.addChild(_loc6_);
            this.xiaozhuBtnArr.push(_loc6_);
            _loc3_++;
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target.name)
         {
            case "xiaozhu0":
               this.dispatchEvent(new BaseEvent(UI_XIAOZHUKUAIPAO_GETJIANGLI,"",[1,1]));
               break;
            case "xiaozhu1":
               this.dispatchEvent(new BaseEvent(UI_XIAOZHUKUAIPAO_GETJIANGLI,"",[1,2]));
               break;
            case "xiaozhu2":
               this.dispatchEvent(new BaseEvent(UI_XIAOZHUKUAIPAO_GETJIANGLI,"",[1,3]));
               break;
            case "xiaozhu3":
               this.dispatchEvent(new BaseEvent(UI_XIAOZHUKUAIPAO_GETJIANGLI,"",[1,4]));
               break;
            case "xiaozhu4":
               this.dispatchEvent(new BaseEvent(UI_XIAOZHUKUAIPAO_GETJIANGLI,"",[1,5]));
               break;
            case "xiaozhu5":
               this.dispatchEvent(new BaseEvent(UI_XIAOZHUKUAIPAO_GETJIANGLI,"",[1,6]));
               break;
            case "xiaozhu6":
               this.dispatchEvent(new BaseEvent(UI_XIAOZHUKUAIPAO_GETJIANGLI,"",[1,7]));
               break;
            case "jiangli0":
               this.dispatchEvent(new BaseEvent(UI_XIAOZHUKUAIPAO_GETJIANGLI,"",[2,8]));
               break;
            case "jiangli1":
               this.dispatchEvent(new BaseEvent(UI_XIAOZHUKUAIPAO_GETJIANGLI,"",[2,9]));
               break;
            case "jiangli2":
               this.dispatchEvent(new BaseEvent(UI_XIAOZHUKUAIPAO_GETJIANGLI,"",[2,10]));
               break;
            case "jiangli3":
               this.dispatchEvent(new BaseEvent(UI_XIAOZHUKUAIPAO_GETJIANGLI,"",[2,11]));
               break;
            case "jiangli4":
               this.dispatchEvent(new BaseEvent(UI_XIAOZHUKUAIPAO_GETJIANGLI,"",[2,12]));
               break;
            case "jiangli5":
               this.dispatchEvent(new BaseEvent(UI_XIAOZHUKUAIPAO_GETJIANGLI,"",[2,13]));
               break;
            case "jiangli6":
               this.dispatchEvent(new BaseEvent(UI_XIAOZHUKUAIPAO_GETJIANGLI,"",[2,14]));
         }
      }
      
      private function onClose(param1:FCloseEvent = null) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
   }
}

