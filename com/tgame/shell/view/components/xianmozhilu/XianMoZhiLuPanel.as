package com.tgame.shell.view.components.xianmozhilu
{
   import com.fireice.text.FLabel;
   import com.fireice.util.Tools;
   import com.tgame.common.GameConfig;
   import com.tgame.common.ui.componets.NewSkinButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.common.utils.ToolTips;
   import com.zcp.common.events.BaseEvent;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.geom.Rectangle;
   import flash.text.TextFormat;
   
   public class XianMoZhiLuPanel extends Sprite
   {
      
      public static const XIANMOZHILU_TUPO_CLICK:String = "XIANMOZHILU_TUPO_CLICK";
      
      public static const XIANMOZHILU_FANYE_CLICK:String = "XIANMOZHILU_FANYE_CLICK";
      
      public static const XIANMOZHILU_INTO_MAP_CLICK:String = "XIANMOZHILU_INTO_MAP_CLICK";
      
      public static const XIANMOZHILU_OPEN_ZHUANGBEI_CLICK:String = "XIANMOZHILU_OPEN_ZHUANGBEI_CLICK";
      
      public static const XIANMOZHILU_OPEN_ZHUANZHI_CLICK:String = "XIANMOZHILU_OPEN_ZHUANZHI_CLICK";
      
      public static const UI_EQUIP_PUT_CLICK:String = "UI_EQUIP_PUT_CLICK";
      
      public static const UI_EQUIP_GET_CLICK:String = "UI_EQUIP_GET_CLICK";
      
      public static const UI_ZHUANHUAN_START_CLICK:String = "UI_ZHUANHUAN_START_CLICK";
      
      private var tz:Sprite;
      
      private var boxContainer:Sprite;
      
      private var leftBtn:NewSkinButton;
      
      private var rightBtn:NewSkinButton;
      
      private var txtPage:FLabel;
      
      private var txtTip:FLabel;
      
      private var currentPage:int;
      
      private var totalPage:int;
      
      public function XianMoZhiLuPanel()
      {
         var closeBtn:NewSkinButton;
         var bg:DisplayObject = null;
         super();
         bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/xianmozhilu/bg.swf");
         bg.x = 0;
         bg.y = 0;
         addChild(bg);
         this.tz = new Sprite();
         this.tz.graphics.beginFill(16711680,0);
         this.tz.graphics.drawRect(0,0,860,60);
         this.tz.graphics.endFill();
         this.tz.width = 860;
         this.tz.height = 60;
         this.tz.x = bg.x;
         this.tz.y = bg.y;
         this.tz.addEventListener(MouseEvent.MOUSE_DOWN,this.mouseDowns);
         addEventListener(MouseEvent.MOUSE_UP,this.mouseReleaseds);
         addChild(this.tz);
         closeBtn = new NewSkinButton();
         closeBtn.skin = "xmzl_close_Button";
         closeBtn.x = 580 + bg.x;
         closeBtn.y = 22 + bg.y;
         addChild(closeBtn);
         closeBtn.addEventListener(MouseEvent.CLICK,this.onClose);
         this.boxContainer = new Sprite();
         addChild(this.boxContainer);
         this.leftBtn = new NewSkinButton();
         this.leftBtn.skin = "xmzl_left_Button";
         this.leftBtn.x = 325 + bg.x;
         this.leftBtn.y = 570 + bg.y;
         addChild(this.leftBtn);
         this.leftBtn.addEventListener(MouseEvent.CLICK,this.onClickHandler);
         this.rightBtn = new NewSkinButton();
         this.rightBtn.skin = "xmzl_right_Button";
         this.rightBtn.x = 485 + bg.x;
         this.rightBtn.y = 570 + bg.y;
         addChild(this.rightBtn);
         this.rightBtn.addEventListener(MouseEvent.CLICK,this.onClickHandler);
         this.txtPage = new FLabel();
         this.txtPage.textColor = StaticValue.YELLOW;
         this.txtPage.filters = StaticValue.filter;
         this.txtPage.x = 400 + bg.x;
         this.txtPage.y = 575 + bg.y;
         this.txtPage.width = 50;
         this.txtPage.width = 20;
         this.txtPage.defaultTextFormat = new TextFormat(null,15);
         addChild(this.txtPage);
         this.txtTip = new FLabel();
         this.txtTip.textColor = StaticValue.RED;
         this.txtTip.filters = StaticValue.filter;
         this.txtTip.text = "玩法说明";
         this.txtTip.x = 550;
         this.txtTip.y = 60;
         addChild(this.txtTip);
         ToolTips.createToolTips(this.txtTip,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + "玩家通过消耗神魔石来突破限制。" + "<br>" + "突破对应条件开启全新功能。" + "<br>" + "地图限制：玩家突破本层仙位将开启傲剑全新天宫地图“天宫道”，" + "<br>" + "全新地图将为大家带来全新的玩法和全新的挑战。" + "<br>" + "等级上限：玩家突破本层仙位将开启傲剑全新等级限制（满级500级）。" + "<br>" + "200级之后，每提升5级，将额外增加500000亿基础攻击。" + "<br>" + "（涉及开放等级以及玩家升级速度，目标挂机两天一级）" + "<br>" + "傲剑转升：玩家突破本层将开启傲剑全新系统转生系统。" + "<br>" + "装备升级：玩家突破本层后将可以将200级装备升级至300级。 " + "<br>" + "仙魔转职：突破现有职业限制晋升全新仙魔模式。" + "<br>";
            return _loc1_ + "</textformat>";
         });
      }
      
      private function onClickHandler(param1:MouseEvent) : void
      {
         switch(param1.currentTarget)
         {
            case this.leftBtn:
               if(this.currentPage > 1)
               {
                  --this.currentPage;
               }
               dispatchEvent(new BaseEvent(XianMoZhiLuPanel.XIANMOZHILU_FANYE_CLICK,"",this.currentPage));
               break;
            case this.rightBtn:
               if(this.currentPage < this.totalPage)
               {
                  this.currentPage += 1;
               }
               dispatchEvent(new BaseEvent(XianMoZhiLuPanel.XIANMOZHILU_FANYE_CLICK,"",this.currentPage));
         }
      }
      
      private function mouseDowns(param1:MouseEvent) : void
      {
         this.parent.setChildIndex(this,parent.numChildren - 1);
         this.startDrag(false,new Rectangle(0,0,Tools.currentStage.stageWidth,Tools.currentStage.stageHeight));
      }
      
      private function mouseReleaseds(param1:MouseEvent) : void
      {
         this.stopDrag();
      }
      
      public function onClose(param1:MouseEvent = null) : void
      {
         if(this.parent != null)
         {
            this.parent.removeChild(this);
         }
      }
      
      public function setXianMoZhiLuData(param1:int = 0, param2:int = 0, param3:Array = null) : void
      {
         var _loc6_:XianMoZhiLu_DiTuXianZhi = null;
         var _loc7_:XianMoZhiLu_ZanWeiKaiQi = null;
         this.currentPage = param1;
         this.totalPage = param2;
         this.txtPage.text = param1 + "/" + param2;
         this.removeContainerBoxChildren();
         var _loc4_:int = int(param3.length);
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            _loc6_ = new XianMoZhiLu_DiTuXianZhi();
            _loc6_.$parent = this;
            _loc6_.x = 265;
            _loc6_.y = 130 + _loc5_ * 110;
            this.boxContainer.addChild(_loc6_);
            _loc6_.setData(param3[_loc5_]);
            _loc5_++;
         }
         if(_loc4_ < 4)
         {
            _loc7_ = new XianMoZhiLu_ZanWeiKaiQi();
            _loc7_.x = 265;
            _loc7_.y = 130 + _loc4_ * 110;
            this.boxContainer.addChild(_loc7_);
         }
      }
      
      public function setGoodsChangeHandler() : void
      {
      }
      
      private function removeContainerBoxChildren() : void
      {
         while(this.boxContainer.numChildren > 0)
         {
            this.boxContainer.removeChildAt(0);
         }
      }
   }
}

