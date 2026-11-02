package com.tgame.shell.view.components
{
   import com.fireice.button.FSimpleButton;
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FTextArea;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.common.vo.item.Skill;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   
   public class WuxiakapaiXiangxiPanel extends FCanvas
   {
      
      public var $parent:DisplayObject;
      
      private var bg:DisplayObject;
      
      private var ft:FTextArea;
      
      private var ftValue:FTextArea;
      
      private var ftDesc:FTextArea;
      
      private var btn:FSimpleButton;
      
      private var skillContainer:Sprite;
      
      private var ftName:FTextArea;
      
      private var ftGo:FTextArea;
      
      private var img:DisplayObject;
      
      private var imgbg:Sprite;
      
      private var bgCanvas:FCanvas;
      
      private var closeBtn:FSimpleButton;
      
      private var kp:int;
      
      public function WuxiakapaiXiangxiPanel()
      {
         super();
         skin = "menuBg";
         width = 675 - 22;
         height = 525 - 45;
         this.init();
      }
      
      public function onClose(param1:MouseEvent = null) : void
      {
         this.$parent.dispatchEvent(new BaseEvent(WuxiakapaiPanel.UI_WUXIAKAPAIXIANGXI_GUANBI_CLICK));
      }
      
      private function init() : void
      {
         this.bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/wuxiakapai/bg2.swf");
         this.bg.x = 0;
         this.bg.y = 2;
         addChild(this.bg);
         this.closeBtn = new FSimpleButton();
         this.closeBtn.skin = "closeButton";
         addChild(this.closeBtn);
         this.closeBtn.x = width - this.closeBtn.width - 10;
         this.closeBtn.y = 5;
         this.closeBtn.addEventListener(MouseEvent.CLICK,this.onClose);
         this.imgbg = new Sprite();
         addChild(this.imgbg);
         this.ft = new FTextArea();
         this.ft.x = 75;
         this.ft.y = 20;
         this.ft.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("激活属性") + "</font>";
         addChild(this.ft);
         this.ftValue = new FTextArea();
         this.ftValue.x = 35;
         this.ftValue.y = 50;
         this.ftValue.width = 150;
         this.ftValue.height = 180;
         this.ftValue.wordWrap = true;
         this.ftValue.textColor = StaticValue.YELLOW;
         this.ftValue.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'></font>";
         addChild(this.ftValue);
         this.ft = new FTextArea();
         this.ft.x = 505;
         this.ft.y = 20;
         this.ft.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("激活技能") + "</font>";
         addChild(this.ft);
         this.ftName = new FTextArea();
         this.ftName.y = 250;
         this.ftName.width = 50;
         this.ftName.height = 24;
         this.ftName.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'></font>";
         this.ftName.x = 230 + 88 - this.ftName.textWidth / 2;
         addChild(this.ftName);
         this.ft = new FTextArea();
         this.ft.x = 120;
         this.ft.y = 310;
         this.ft.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("卡牌描述：") + "</font>";
         addChild(this.ft);
         this.ftDesc = new FTextArea();
         this.ftDesc.x = 120;
         this.ftDesc.y = 330;
         this.ftDesc.width = 425;
         this.ftDesc.height = 45;
         this.ftDesc.wordWrap = true;
         this.ftDesc.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'></font>";
         addChild(this.ftDesc);
         this.ftGo = new FTextArea();
         this.ftGo.x = 280;
         this.ftGo.y = 385;
         this.ftGo.width = 150;
         this.ftGo.height = 20;
         addChild(this.ftGo);
         this.ft = new FTextArea();
         this.ft.x = 305;
         this.ft.y = 405;
         this.ft.width = 120;
         this.ft.height = 20;
         this.ft.htmlText = "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("方能兑换卡牌") + "</font>";
         addChild(this.ft);
         this.btn = new FSimpleButton();
         this.btn.skin = "kapai_duihuan_Button";
         this.btn.x = 280;
         this.btn.y = 430;
         this.btn.addEventListener(MouseEvent.CLICK,this.onClick);
         addChild(this.btn);
         this.skillContainer = new Sprite();
         this.skillContainer.x = 450 - 20 - 10;
         this.skillContainer.y = 50;
         addChild(this.skillContainer);
      }
      
      private function onClick(param1:MouseEvent = null) : void
      {
         var _loc2_:FSimpleButton = param1.target as FSimpleButton;
         if(_loc2_.skin == "kapai_duihuan_Button")
         {
            this.$parent.dispatchEvent(new BaseEvent(WuxiakapaiPanel.UI_WUXIAKAPAI_DUIHUAN_CLICK,"",this.kp));
         }
         else if(_loc2_.skin == "kapai_jihuo_Button")
         {
            this.$parent.dispatchEvent(new BaseEvent(WuxiakapaiPanel.UI_WUXIAKAPAI_WAIXIAN_CLICK,"",[this.kp,1]));
         }
         else if(_loc2_.skin == "kapai_quxiao_Button")
         {
            this.$parent.dispatchEvent(new BaseEvent(WuxiakapaiPanel.UI_WUXIAKAPAI_WAIXIAN_CLICK,"",[this.kp,2]));
         }
      }
      
      private function typeName(param1:int) : String
      {
         var _loc2_:String = "";
         switch(param1)
         {
            case 1:
               _loc2_ = LanResManager.getLanCommonTextWords("攻击");
               break;
            case 2:
               _loc2_ = LanResManager.getLanCommonTextWords("防御");
               break;
            case 3:
               _loc2_ = LanResManager.getLanCommonTextWords("暴击");
               break;
            case 4:
               _loc2_ = LanResManager.getLanCommonTextWords("闪避");
               break;
            case 5:
               _loc2_ = LanResManager.getLanCommonTextWords("生命");
               break;
            case 6:
               _loc2_ = LanResManager.getLanCommonTextWords("体力");
               break;
            case 7:
               _loc2_ = LanResManager.getLanCommonTextWords("内力");
               break;
            case 49:
               _loc2_ = LanResManager.getLanCommonTextWords("武功层数");
         }
         return _loc2_;
      }
      
      public function setData(param1:int, param2:int, param3:int, param4:int, param5:String, param6:String, param7:String, param8:String, param9:int, param10:int, param11:int) : void
      {
         var _loc14_:int = 0;
         var _loc16_:DisplayObject = null;
         var _loc18_:Array = null;
         var _loc19_:Bitmap = null;
         var _loc20_:Skill = null;
         var _loc21_:ItemFace = null;
         var _loc22_:FTextArea = null;
         var _loc23_:Bitmap = null;
         this.ftDesc.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + param8 + "</font>";
         this.kp = param2;
         var _loc12_:Array = param6.split(",");
         var _loc13_:String = "";
         _loc14_ = 0;
         while(_loc14_ < _loc12_.length)
         {
            _loc18_ = _loc12_[_loc14_].split(":");
            _loc13_ += this.typeName(_loc18_[0]) + ":" + _loc18_[1] + "<br>";
            _loc14_++;
         }
         _loc13_ = _loc13_.substr(0,_loc13_.length - 4);
         this.ftValue.htmlText = "<textformat leading=\'10\'>" + _loc13_ + "</textformat>";
         while(this.skillContainer.numChildren > 0)
         {
            this.skillContainer.removeChildAt(0);
         }
         while(this.imgbg.numChildren > 0)
         {
            this.imgbg.removeChildAt(0);
         }
         var _loc15_:Array = param7.split(";");
         _loc14_ = 0;
         while(_loc14_ < _loc15_.length)
         {
            _loc19_ = StaticValue.getBitmapByClassName("ui.tiem.slot");
            _loc19_.x = 20;
            _loc19_.y = 10 + 80 * _loc14_;
            this.skillContainer.addChild(_loc19_);
            _loc20_ = new Skill(_loc15_[_loc14_]);
            if(param4 == 0)
            {
               _loc20_.isLearn = 0;
            }
            else
            {
               _loc20_.isLearn = 1;
            }
            _loc21_ = new ItemFace(_loc20_);
            _loc21_.x = 22;
            _loc21_.y = 12 + 80 * _loc14_;
            _loc21_.setShowCount(false);
            this.skillContainer.addChild(_loc21_);
            _loc22_ = new FTextArea();
            _loc22_.x = 65;
            _loc22_.y = 0 + 82 * _loc14_;
            _loc22_.width = 150;
            _loc22_.height = 75;
            _loc22_.wordWrap = true;
            _loc22_.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("卡牌技能：") + _loc20_.res.name + "<br>" + _loc20_.res.desc + "</font>";
            this.skillContainer.addChild(_loc22_);
            _loc23_ = StaticValue.getBitmapByClassName("ui.line");
            _loc23_.x = 2 + 10;
            _loc23_.y = 70 + 82 * _loc14_;
            this.skillContainer.addChild(_loc23_);
            _loc23_.width = 200;
            _loc14_++;
         }
         this.img = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/wuxiakapai/img/" + param3 + "_b.swf");
         this.img.x = 235 - 30;
         this.img.y = 15;
         this.imgbg.addChild(this.img);
         if(param11 == 2)
         {
            _loc16_ = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/wuxiakapai/pure_big.swf");
            _loc16_.x = 235 - 30;
            _loc16_.y = 15;
            this.imgbg.addChild(_loc16_);
            _loc16_ = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/wuxiakapai/pure_bgb.swf");
            _loc16_.x = 250 - 30;
            _loc16_.y = 240;
            this.imgbg.addChild(_loc16_);
         }
         else if(param11 == 3)
         {
            _loc16_ = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/wuxiakapai/orange_big.swf");
            _loc16_.x = 235 - 30;
            _loc16_.y = 15;
            this.imgbg.addChild(_loc16_);
            _loc16_ = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/wuxiakapai/orange_bgb.swf");
            _loc16_.x = 250 - 30;
            _loc16_.y = 240;
            this.imgbg.addChild(_loc16_);
         }
         else
         {
            _loc16_ = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/wuxiakapai/green_bgb.swf");
            _loc16_.x = 250 - 30;
            _loc16_.y = 240;
            this.imgbg.addChild(_loc16_);
         }
         if(param4 == 0)
         {
            this.btn.skin = "kapai_duihuan_Button";
         }
         else if(param4 == 1)
         {
            this.btn.skin = "kapai_jihuo_Button";
         }
         else
         {
            this.btn.skin = "kapai_quxiao_Button";
         }
         if(param1 != -1)
         {
            this.btn.enabled = false;
         }
         else
         {
            this.btn.enabled = true;
         }
         this.ftName.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + param5 + "</font>";
         this.ftName.x = 250 - 30 + 88 - this.ftName.textWidth / 2;
         var _loc17_:Goods = new Goods(param9);
         this.ftGo.htmlText = "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("需要：") + param10 + LanResManager.getLanCommonTextWords("个") + _loc17_.res.name + "</font>";
      }
   }
}

