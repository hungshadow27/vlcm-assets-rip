package com.tgame.shell.view.components.ynLongwuge
{
   import com.fireice.button.FSimpleButton;
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FTextArea;
   import com.fireice.util.Tools;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.GameState;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.moudels.ynLongwuge.model.info.YNlongwugeVO;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.text.*;
   
   public class YNlongwuge_sishengshou extends Sprite
   {
      
      public var $parent:DisplayObject;
      
      private var ft:FTextArea;
      
      private var ftCailiao:FTextArea;
      
      private var ft_shouyi:FTextArea;
      
      private var ft_nextshouyi:FTextArea;
      
      private var ft_copper:FTextArea;
      
      private var ft_yuanbao:FTextArea;
      
      private var ft_level:FTextArea;
      
      private var ft_yincang:FTextArea;
      
      private var btn_up:FSimpleButton;
      
      private var btn_next:FSimpleButton;
      
      private var btn_pre:FSimpleButton;
      
      private var sprItem:Sprite;
      
      private var typeSpr:Sprite;
      
      private var typeBg:DisplayObject;
      
      private var typeObj:Object = {};
      
      private var imgSpr:Sprite;
      
      private var imgBg:DisplayObject;
      
      private var imgObj:Object = {};
      
      private var nameSpr:Sprite;
      
      private var btnYC:FSimpleButton;
      
      private var type:int = 0;
      
      private var tipCanvas:FCanvas;
      
      private var tip:FTextArea;
      
      private var mainchar:Boolean = true;
      
      public function YNlongwuge_sishengshou()
      {
         super();
         this.init();
      }
      
      private function init() : void
      {
         var bg:DisplayObject;
         var sxsy:DisplayObject;
         var nameBg:DisplayObject;
         var img:DisplayObject;
         var right:DisplayObject = null;
         this.tipCanvas = new FCanvas();
         this.tipCanvas.skin = "backGroud";
         this.tip = new FTextArea();
         with(this.tip)
         {
            x = 2;
            y = 2;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.WHITE;
         }
         this.tipCanvas.addChild(this.tip);
         bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/ynLongwuge/sss/sss_bg.swf");
         bg.x = 0;
         bg.y = 2;
         addChild(bg);
         right = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/ynLongwuge/right.swf");
         right.x = 700;
         right.y = 32;
         addChild(right);
         sxsy = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/ynLongwuge/sxsy.swf");
         sxsy.x = 510;
         sxsy.y = 30;
         addChild(sxsy);
         nameBg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/ynLongwuge/sss/sss_name_bg.swf");
         nameBg.x = 185;
         nameBg.y = 375;
         addChild(nameBg);
         this.btnYC = new FSimpleButton();
         this.btnYC.x = 85;
         this.btnYC.y = 45;
         this.btnYC.skin = "ynSSSQLanBtn";
         addChild(this.btnYC);
         this.btnYC.addEventListener(MouseEvent.MOUSE_OUT,this.onMouse);
         this.btnYC.addEventListener(MouseEvent.MOUSE_OVER,this.onMouse);
         this.sprItem = new Sprite();
         this.sprItem.x = 760 - 10;
         this.sprItem.y = 360 + 10;
         addChild(this.sprItem);
         this.ft = new FTextArea();
         this.ft.x = 490;
         this.ft.y = 30;
         this.ft.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("属性收益") + "</font>";
         this.ft.width = 100;
         this.ft.height = 22;
         this.ft = new FTextArea();
         this.ft.x = 670;
         this.ft.y = 65;
         this.ft.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("1.建筑每升一级都会更换一次外观。") + "</font><br>" + "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("2.建筑等级越高获得的收益越高。") + "</font><br>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("3.升级材料可以通过充值活动获得。") + "</font>";
         this.ft.width = 145;
         this.ft.height = 120;
         this.ft.wordWrap = true;
         addChild(this.ft);
         this.ft = new FTextArea();
         this.ft.x = 680;
         this.ft.y = 315;
         this.ft.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("消耗铜币") + "</font>";
         this.ft.width = 100;
         this.ft.height = 22;
         addChild(this.ft);
         this.ft = new FTextArea();
         this.ft.x = 680;
         this.ft.y = 340;
         this.ft.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("消耗元宝") + "</font>";
         this.ft.width = 100;
         this.ft.height = 22;
         addChild(this.ft);
         this.ftCailiao = new FTextArea();
         this.ftCailiao.x = 680;
         this.ftCailiao.y = 375;
         this.ftCailiao.htmlText = "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("消耗材料") + "</font>";
         this.ftCailiao.width = 65;
         this.ftCailiao.height = 22;
         addChild(this.ftCailiao);
         this.ft_shouyi = new FTextArea();
         this.ft_shouyi.x = 475 + 35;
         this.ft_shouyi.y = 45 + 7;
         this.ft_shouyi.textColor = StaticValue.YELLOW;
         this.ft_shouyi.htmlText = "";
         this.ft_shouyi.width = 100;
         this.ft_shouyi.height = 22;
         addChild(this.ft_shouyi);
         img = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/ynLongwuge/money.swf");
         img.x = 790;
         img.y = 240;
         this.ft_nextshouyi = new FTextArea();
         this.ft_nextshouyi.x = 685;
         this.ft_nextshouyi.y = 210;
         this.ft_nextshouyi.textColor = StaticValue.YELLOW;
         this.ft_nextshouyi.htmlText = "";
         this.ft_nextshouyi.width = 200;
         this.ft_nextshouyi.height = 22;
         addChild(this.ft_nextshouyi);
         img = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/ynLongwuge/money.swf");
         img.x = 790;
         img.y = 215;
         this.ft_copper = new FTextArea();
         this.ft_copper.x = 735;
         this.ft_copper.y = 315;
         this.ft_copper.textColor = StaticValue.YELLOW;
         this.ft_copper.htmlText = "";
         this.ft_copper.width = 100;
         this.ft_copper.height = 22;
         addChild(this.ft_copper);
         this.ft_yuanbao = new FTextArea();
         this.ft_yuanbao.x = 735;
         this.ft_yuanbao.y = 340;
         this.ft_yuanbao.textColor = StaticValue.YELLOW;
         this.ft_yuanbao.htmlText = "";
         this.ft_yuanbao.width = 100;
         this.ft_yuanbao.height = 22;
         addChild(this.ft_yuanbao);
         this.ft_level = new FTextArea();
         this.ft_level.x = 260 + 60;
         this.ft_level.y = 380 + 18;
         this.ft_level.textColor = StaticValue.WHITE;
         this.ft_level.htmlText = "";
         this.ft_level.width = 200;
         this.ft_level.height = 22;
         addChild(this.ft_level);
         this.btn_up = new FSimpleButton();
         this.btn_up.x = 695;
         this.btn_up.y = 410;
         this.btn_up.skin = "ynLWGUpdateBtn";
         this.btn_up.addEventListener(MouseEvent.CLICK,this.onClick);
         addChild(this.btn_up);
         this.typeSpr = new Sprite();
         addChild(this.typeSpr);
         this.imgSpr = new Sprite();
         addChild(this.imgSpr);
         this.nameSpr = new Sprite();
         addChild(this.nameSpr);
         this.btn_next = new FSimpleButton();
         this.btn_next.x = 615;
         this.btn_next.y = 130;
         this.btn_next.skin = "ynSSSNextBtn";
         this.btn_next.addEventListener(MouseEvent.CLICK,this.onClick);
         addChild(this.btn_next);
         this.btn_pre = new FSimpleButton();
         this.btn_pre.x = 10;
         this.btn_pre.y = 130;
         this.btn_pre.skin = "ynSSSPreBtn";
         this.btn_pre.addEventListener(MouseEvent.CLICK,this.onClick);
         addChild(this.btn_pre);
      }
      
      private function onMouse(param1:MouseEvent) : void
      {
         var _loc2_:String = null;
         var _loc3_:Point = null;
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               Tools.currentStage.addChild(this.tipCanvas);
               this.tipCanvas.visible = false;
               param1.target.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouse);
               break;
            case MouseEvent.MOUSE_MOVE:
               if(param1.target)
               {
                  _loc2_ = param1.target.name;
                  this.tip.htmlText = _loc2_;
                  this.tipCanvas.width = this.tip.width + 4;
                  this.tipCanvas.height = this.tip.height + 4;
                  this.tipCanvas.visible = true;
                  _loc3_ = param1.target.parent.localToGlobal(new Point(param1.target.x,param1.target.y));
                  this.tipCanvas.x = _loc3_.x - this.tipCanvas.width;
                  this.tipCanvas.y = _loc3_.y;
               }
               else
               {
                  this.tipCanvas.visible = false;
               }
               break;
            case MouseEvent.MOUSE_OUT:
               param1.target.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouse);
               if(this.tipCanvas.parent)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.btn_up:
               this.$parent.dispatchEvent(new BaseEvent(YNlongwugePanel.UI_YN_LONGWUGE_SHENGJI_CLICK,"",this.type));
               break;
            case this.btn_next:
               this.$parent.dispatchEvent(new BaseEvent(YNlongwugePanel.UI_YN_LONGWUGE_SISHENGSHOU_PAGE_CLICK,"",[this.type,2,this.mainchar]));
               break;
            case this.btn_pre:
               this.$parent.dispatchEvent(new BaseEvent(YNlongwugePanel.UI_YN_LONGWUGE_SISHENGSHOU_PAGE_CLICK,"",[this.type,1,this.mainchar]));
         }
      }
      
      public function setData(param1:YNlongwugeVO) : void
      {
         var _loc6_:Goods = null;
         var _loc7_:ItemFace = null;
         var _loc8_:int = 0;
         var _loc9_:Bitmap = null;
         var _loc10_:String = null;
         this.mainchar = param1.playerID == -1 ? true : false;
         this.type = param1.type;
         while(this.typeSpr.numChildren > 0)
         {
            this.typeSpr.removeChildAt(0);
         }
         while(this.imgSpr.numChildren > 0)
         {
            this.imgSpr.removeChildAt(0);
         }
         while(this.nameSpr.numChildren > 0)
         {
            this.nameSpr.removeChildAt(0);
         }
         if(this.typeObj[this.type] != null)
         {
            this.typeBg = this.typeObj[this.type];
         }
         else
         {
            this.typeBg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/ynLongwuge/sss/" + String(this.type) + ".swf");
            this.typeObj[this.type] = this.typeBg;
         }
         this.typeBg.x = 55;
         this.typeBg.y = 230;
         this.typeSpr.addChild(this.typeBg);
         var _loc2_:int = 0;
         if(param1.level == 1 || param1.level == 2)
         {
            _loc2_ = 1;
         }
         else if(param1.level == 3 || param1.level == 4)
         {
            _loc2_ = 2;
         }
         else
         {
            _loc2_ = 3;
         }
         var _loc3_:String = String(this.type) + "_" + String(_loc2_);
         if(this.imgObj[_loc3_] != null)
         {
            this.imgBg = this.imgObj[_loc3_];
         }
         else
         {
            this.imgBg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/ynLongwuge/sss/" + _loc3_ + ".swf");
            this.imgObj[_loc3_] = this.imgBg;
         }
         this.imgBg.x = 180;
         this.imgBg.y = 30;
         this.imgSpr.addChild(this.imgBg);
         this.ft_shouyi.htmlText = param1.sysx;
         this.ft_nextshouyi.htmlText = param1.next_sysx;
         var _loc4_:DisplayObject = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/ynLongwuge/sss/lv" + String(param1.level) + ".swf");
         _loc4_.x = 303;
         _loc4_.y = 395;
         this.nameSpr.addChild(_loc4_);
         while(this.sprItem.numChildren > 0)
         {
            this.sprItem.removeChildAt(0);
         }
         if(param1.sjxhwp > 0)
         {
            _loc6_ = new Goods(param1.sjxhwp);
            _loc6_.count = param1.sjxhsl;
            _loc7_ = new ItemFace(_loc6_);
            _loc8_ = GameInstance.mainCharData.goodsInfo.getGoodsNumByID(param1.sjxhwp,true);
            if(_loc8_ < param1.sjxhsl)
            {
               _loc7_.filters = Tools.blackWhiteFilter;
            }
            else
            {
               _loc7_.filters = [];
            }
            _loc9_ = StaticValue.getBitmapByClassName("ui.tiem.slot");
            _loc9_.x = -2;
            _loc9_.y = -2;
            this.sprItem.addChild(_loc9_);
            this.sprItem.addChild(_loc7_);
            _loc10_ = param1.sjxhtb > 10000 ? String(Math.floor(param1.sjxhtb / 10000)) + LanResManager.getLanCommonTextWords("万") : String(param1.sjxhtb);
            this.ft_copper.htmlText = _loc10_;
            this.ft_yuanbao.htmlText = String(param1.sjxhyb);
         }
         else
         {
            this.ft_copper.htmlText = LanResManager.getLanCommonTextWords("已达顶级");
            this.ft_yuanbao.htmlText = LanResManager.getLanCommonTextWords("已达顶级");
         }
         if(param1.level == 1)
         {
            this.btn_pre.enabled = false;
         }
         else
         {
            this.btn_pre.enabled = true;
         }
         if(param1.level == 5)
         {
            this.btn_next.enabled = false;
         }
         else
         {
            this.btn_next.enabled = true;
         }
         var _loc5_:Array = this.setYC(this.type);
         this.btnYC.skin = _loc5_[0];
         this.btnYC.name = String(_loc5_[1]);
         this.setMainChar();
         if(param1.level == 5)
         {
            this.btn_up.enabled = false;
            this.ftCailiao.visible = false;
            this.sprItem.visible = false;
         }
         else
         {
            this.btn_up.enabled = true;
            this.ftCailiao.visible = true;
            this.sprItem.visible = true;
         }
      }
      
      private function setYC(param1:int) : Array
      {
         var _loc2_:Boolean = this.ycBO(param1);
         var _loc3_:Array = [];
         var _loc4_:String = "";
         switch(param1)
         {
            case 2:
               if(_loc2_)
               {
                  _loc4_ = "ynSSSQLliangBtn";
               }
               else
               {
                  _loc4_ = "ynSSSQLanBtn";
               }
               break;
            case 3:
               if(_loc2_)
               {
                  _loc4_ = "ynSSSBHliangBtn";
               }
               else
               {
                  _loc4_ = "ynSSSBHanBtn";
               }
               break;
            case 4:
               if(_loc2_)
               {
                  _loc4_ = "ynSSSZQliangBtn";
               }
               else
               {
                  _loc4_ = "ynSSSZQanBtn";
               }
               break;
            case 5:
               if(_loc2_)
               {
                  _loc4_ = "ynSSSXWliangBtn";
               }
               else
               {
                  _loc4_ = "ynSSSXWanBtn";
               }
         }
         _loc3_[0] = _loc4_;
         if(_loc2_)
         {
            _loc3_[1] = "<font color=\'#ff0000\'>" + LanResManager.getLanCommonTextWords("属性翻倍 已激活") + "</font>";
         }
         else
         {
            _loc3_[1] = "<font color=\'#5c5c5c\'>" + LanResManager.getLanCommonTextWords("属性翻倍 未激活") + "<br>" + LanResManager.getLanCommonTextWords("注：三级以上可激活") + "</font>";
         }
         return _loc3_;
      }
      
      private function ycBO(param1:int) : Boolean
      {
         var _loc2_:Boolean = false;
         switch(param1)
         {
            case 2:
               _loc2_ = Boolean(GameState.dictMainStatus[SpecialGoodsID.YN_LONGWUGE_QINGLONGID]);
               break;
            case 3:
               _loc2_ = Boolean(GameState.dictMainStatus[SpecialGoodsID.YN_LONGWUGE_BAIHUID]);
               break;
            case 4:
               _loc2_ = Boolean(GameState.dictMainStatus[SpecialGoodsID.YN_LONGWUGE_ZHUQUEID]);
               break;
            case 5:
               _loc2_ = Boolean(GameState.dictMainStatus[SpecialGoodsID.YN_LONGWUGE_XUANWUID]);
         }
         return _loc2_;
      }
      
      private function getName(param1:int) : String
      {
         var _loc2_:String = "";
         switch(param1)
         {
            case 1:
               _loc2_ = LanResManager.getLanCommonTextWords("一级");
               break;
            case 2:
               _loc2_ = LanResManager.getLanCommonTextWords("二级");
               break;
            case 3:
               _loc2_ = LanResManager.getLanCommonTextWords("三级");
               break;
            case 4:
               _loc2_ = LanResManager.getLanCommonTextWords("四级");
               break;
            case 5:
               _loc2_ = LanResManager.getLanCommonTextWords("五级");
               break;
            case 6:
               _loc2_ = LanResManager.getLanCommonTextWords("六级");
               break;
            case 7:
               _loc2_ = LanResManager.getLanCommonTextWords("七级");
               break;
            case 8:
               _loc2_ = LanResManager.getLanCommonTextWords("八级");
               break;
            case 9:
               _loc2_ = LanResManager.getLanCommonTextWords("九级");
               break;
            case 10:
               _loc2_ = LanResManager.getLanCommonTextWords("十级");
         }
         return _loc2_;
      }
      
      private function getType(param1:int) : String
      {
         var _loc2_:String = "";
         switch(param1)
         {
            case 2:
               _loc2_ = LanResManager.getLanCommonTextWords("青龙阁");
               break;
            case 3:
               _loc2_ = LanResManager.getLanCommonTextWords("白虎阁");
               break;
            case 4:
               _loc2_ = LanResManager.getLanCommonTextWords("朱雀阁");
               break;
            case 5:
               _loc2_ = LanResManager.getLanCommonTextWords("玄武阁");
         }
         return _loc2_;
      }
      
      private function setMainChar() : void
      {
         if(!this.mainchar)
         {
            this.btn_next.enabled = false;
            this.btn_pre.enabled = false;
            this.btn_up.enabled = false;
         }
      }
   }
}

