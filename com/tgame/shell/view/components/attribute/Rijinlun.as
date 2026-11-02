package com.tgame.shell.view.components.attribute
{
   import br.com.stimuli.loading.loadingtypes.LoadingItem;
   import com.fireice.button.FSimpleButton;
   import com.fireice.checkBox.FCheckBox;
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FTextArea;
   import com.fireice.util.F9GridBitmap;
   import com.fireice.util.Tools;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.ItemPositionRange;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.common.vo.item.Skill;
   import com.tgame.shell.view.components.CharAttribute;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.manager.LoaderManager;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   import gs.TweenMax;
   
   public class Rijinlun extends Sprite
   {
      
      public static const UI_RIJINLUN_GUANBI_CLICK:String = "UI_RIJINLUN_GUANBI_CLICK";
      
      public var _$parent:DisplayObject;
      
      private var ft:FTextArea;
      
      private var nextBtn:FSimpleButton;
      
      private var preBtn:FSimpleButton;
      
      private var check:FCheckBox;
      
      private var skillContanier:Sprite;
      
      private var ftValue:FTextArea;
      
      private var ftDesc:FTextArea;
      
      private var zclkBtn:FSimpleButton;
      
      private var tupoBtn:SecondButton;
      
      private var bg9:F9GridBitmap;
      
      private var bgSpr:Sprite;
      
      private var bg:DisplayObject;
      
      private var tf:TextFormat;
      
      private var ftaName:FTextArea;
      
      private var tipCanvas:FCanvas;
      
      private var tip:FTextArea;
      
      private var feixingBtn:FSimpleButton;
      
      private var nowId:int;
      
      private var lookingId:int;
      
      private var tupoBo:Boolean = false;
      
      private var yanhuaMc:MovieClip;
      
      private var gongMc:MovieClip;
      
      private var gongMcSpr:Sprite;
      
      private var mcObj:Object = {};
      
      private var loadUrl:String;
      
      private var rijinlunTupo:RijinlunTupoCanvas;
      
      private var equipContainers:Sprite;
      
      private var kuangHD:Bitmap;
      
      public function Rijinlun()
      {
         super();
         this.init();
      }
      
      private function init() : void
      {
         var line:Bitmap;
         var $mask:Sprite;
         var cas:FCanvas = null;
         cas = new FCanvas();
         cas.skin = "box_transparence";
         cas.x = 0;
         cas.y = 0;
         cas.width = 405;
         cas.height = 365;
         addChild(cas);
         this.bg9 = Tools.get9GridBitmpByName("biwuDahui_bg");
         this.bg9.width = 160;
         this.bg9.height = 220;
         addChild(this.bg9);
         this.bg9.x = 243;
         this.bg9.y = 5;
         this.bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/rijinlun/bg.swf");
         this.bg.visible = true;
         this.bg.x = 2;
         this.bg.y = 2;
         addChild(this.bg);
         this.bgSpr = new Sprite();
         addChild(this.bgSpr);
         this.ft = new FTextArea();
         this.ft.x = 305;
         this.ft.y = 14;
         this.ft.htmlText = LanResManager.getLanCommonTextWords("技能");
         this.ft.textColor = StaticValue.ORANGE;
         addChild(this.ft);
         this.ft.height = 20;
         this.ft = new FTextArea();
         this.ft.x = 300;
         this.ft.y = 37;
         this.ft.htmlText = LanResManager.getLanCommonTextWords("日金轮");
         this.ft.height = 20;
         this.ft.textColor = StaticValue.ORANGE;
         addChild(this.ft);
         this.gongMcSpr = new Sprite();
         this.gongMcSpr.x = 17;
         this.gongMcSpr.y = 1;
         addChild(this.gongMcSpr);
         this.feixingBtn = new FSimpleButton();
         addChild(this.feixingBtn);
         this.feixingBtn.x = 70;
         this.feixingBtn.y = 190;
         this.feixingBtn.skin = "feixingBtn";
         this.feixingBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.feixingBtn.addEventListener(MouseEvent.MOUSE_OVER,this.onFeixingTip);
         this.feixingBtn.addEventListener(MouseEvent.MOUSE_OUT,this.onFeixingTip);
         this.tipCanvas = new FCanvas();
         this.tipCanvas.skin = "backGroud";
         this.tip = new FTextArea();
         this.tip.x = 2;
         this.tip.y = 2;
         this.tip.autoSize = TextFieldAutoSize.LEFT;
         this.tip.textColor = StaticValue.WHITE;
         this.tip.filters = StaticValue.filter;
         this.tipCanvas.addChild(this.tip);
         this.preBtn = new FSimpleButton();
         this.preBtn.skin = "previousButton";
         addChild(this.preBtn);
         this.preBtn.x = 45;
         this.preBtn.y = 230;
         this.preBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.tf = new TextFormat();
         this.tf.align = "center";
         this.ftaName = new FTextArea();
         with(this.ftaName)
         {
            filters = StaticValue.filter;
            x = 65;
            y = 230;
            defaultTextFormat = tf;
            textColor = StaticValue.WHITE;
            width = 50;
            height = 16;
            background = true;
            backgroundColor = 1186072;
         }
         addChild(this.ftaName);
         this.nextBtn = new FSimpleButton();
         this.nextBtn.skin = "nextButton";
         addChild(this.nextBtn);
         this.nextBtn.x = 115;
         this.nextBtn.y = 230;
         this.nextBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.tupoBtn = new SecondButton();
         this.tupoBtn.x = 145;
         this.tupoBtn.y = 230;
         this.tupoBtn.label = LanResManager.getLanCommonTextWords("开始领悟");
         this.tupoBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         addChild(this.tupoBtn);
         this.ftDesc = new FTextArea();
         this.ftDesc.x = 10;
         this.ftDesc.y = 265;
         this.ftDesc.htmlText = "";
         this.ftDesc.textColor = StaticValue.WHITE;
         addChild(this.ftDesc);
         this.ftDesc.width = 220;
         this.ftDesc.height = 100;
         this.ftDesc.wordWrap = true;
         this.ftValue = new FTextArea();
         this.ftValue.x = 236;
         this.ftValue.y = 240;
         this.ftValue.textColor = StaticValue.GREEN;
         addChild(this.ftValue);
         this.ftValue.width = 130;
         this.ftValue.height = 120;
         this.ftValue.wordWrap = true;
         this.skillContanier = new Sprite();
         this.skillContanier.x = 240;
         this.skillContanier.y = 11;
         addChild(this.skillContanier);
         line = StaticValue.getBitmapByClassName("ui.line");
         line.x = 240;
         line.y;
         addChild(line);
         this.check = new FCheckBox();
         addChild(this.check);
         this.check.x = 282;
         this.check.y = 340;
         this.check.enabled = true;
         this.check.text = LanResManager.getLanCommonTextWords("显示外观");
         this.check.textColor = StaticValue.WHITE;
         this.check.addEventListener(MouseEvent.CLICK,this.onClick);
         this.rijinlunTupo = new RijinlunTupoCanvas();
         addChild(this.rijinlunTupo);
         this.rijinlunTupo.x = 138;
         this.rijinlunTupo.y = -10;
         $mask = new Sprite();
         $mask.mouseEnabled = false;
         addChild($mask);
         $mask.x = 410;
         $mask.y = -10;
         with($mask.graphics)
         {
            beginFill(16711680,0.5);
            drawRect(0,0,500,390);
            endFill();
         }
         this.rijinlunTupo.mask = $mask;
         addEventListener(UI_RIJINLUN_GUANBI_CLICK,this.onCloseTupo);
         this.equipContainers = new Sprite();
         this.equipContainers.x = 9;
         this.equipContainers.y = 180;
         with(this.equipContainers.graphics)
         {
            beginFill(16711680,0);
            drawRect(0,0,40,40);
            endFill();
         }
         this.equipContainers.addEventListener(MouseEvent.MOUSE_UP,this.onItemClick00,false,30);
         addChild(this.equipContainers);
      }
      
      private function onItemClick00(param1:MouseEvent) : void
      {
         this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_CHAR_ATTRIBUTE_MENU_SHOW,"",param1));
      }
      
      private function onCloseTupo(param1:BaseEvent) : void
      {
         this.showTuPoPanel(false);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.feixingBtn:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_RIJINLUN_FEIXING_CLICK));
               break;
            case this.tupoBtn:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_RIJINLUN_LINGWU_SHOW,"",this.nowId));
               break;
            case this.preBtn:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_RIJINLUN_HUANYE_CLICK,"",this.lookingId - 1));
               break;
            case this.nextBtn:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_RIJINLUN_HUANYE_CLICK,"",this.lookingId + 1));
         }
         switch(param1.currentTarget)
         {
            case this.check:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_RIJINLUN_WAIGUAN_CLICK,"",this.check.selectState));
         }
      }
      
      private function onFeixingTip(param1:MouseEvent) : void
      {
         var _loc2_:String = null;
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               this.feixingBtn.addEventListener(MouseEvent.MOUSE_MOVE,this.onFeixingTip);
               break;
            case MouseEvent.MOUSE_MOVE:
               _loc2_ = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("展翅凌空将在日金轮升至六阶时可使用，使用本功能后玩家将进入飞行状态，") + "<br>" + LanResManager.getLanCommonTextWords("飞行时玩家的闪避将大幅提升！飞行时将消耗一定的体力值。") + "</textformat>";
               this.showTip(_loc2_);
               break;
            case MouseEvent.MOUSE_OUT:
               if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
               this.feixingBtn.removeEventListener(MouseEvent.MOUSE_MOVE,this.onFeixingTip);
         }
      }
      
      private function showTip(param1:String) : void
      {
         this.tip.htmlText = param1;
         addChild(this.tipCanvas);
         this.tipCanvas.width = this.tip.width + 4;
         this.tipCanvas.height = this.tip.height + 4;
         this.tipCanvas.x = mouseX + 5;
         this.tipCanvas.y = mouseY + 5;
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
         }
         return _loc2_;
      }
      
      public function setData(param1:int, param2:int, param3:int, param4:String, param5:String, param6:String, param7:int, param8:String) : void
      {
         var _loc12_:int = 0;
         var _loc15_:Bitmap = null;
         var _loc16_:Skill = null;
         var _loc17_:ItemFace = null;
         var _loc18_:Array = null;
         if(param2 != 6)
         {
            this.feixingBtn.enabled = false;
            this.check.enabled = false;
         }
         else
         {
            this.feixingBtn.enabled = true;
            this.check.enabled = true;
         }
         this.lookingId = param3;
         this.nowId = param2;
         this.setSwf();
         while(this.skillContanier.numChildren > 0)
         {
            this.skillContanier.removeChildAt(0);
         }
         if(param3 <= 1)
         {
            this.preBtn.enabled = false;
         }
         else
         {
            this.preBtn.enabled = true;
         }
         if(param3 == 6)
         {
            this.nextBtn.enabled = false;
         }
         else
         {
            this.nextBtn.enabled = true;
         }
         this.ftaName.htmlText = param4;
         if(param2 >= param3 && param3 >= 0 || param2 == 6)
         {
            this.tupoBtn.label = LanResManager.getLanCommonTextWords("已领悟");
            this.tupoBtn.enabled = false;
         }
         else if(param2 + 1 == param3)
         {
            this.tupoBtn.label = LanResManager.getLanCommonTextWords("开始领悟");
            this.tupoBtn.enabled = true;
         }
         else
         {
            this.tupoBtn.label = LanResManager.getLanCommonTextWords("未领悟");
            this.tupoBtn.enabled = false;
         }
         var _loc9_:Array = param6.split(",");
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         _loc12_ = 0;
         while(_loc12_ < _loc9_.length)
         {
            if(_loc12_ % 2 == 0)
            {
               _loc10_ = 0;
               if(_loc12_ != 0)
               {
                  _loc11_++;
               }
            }
            _loc15_ = StaticValue.getBitmapByClassName("ui.tiem.slot");
            _loc15_.x = 35 + 55 * _loc10_;
            _loc15_.y = 50 + 55 * _loc11_;
            this.skillContanier.addChild(_loc15_);
            _loc16_ = new Skill(_loc9_[_loc12_]);
            if(_loc12_ + 1 <= param2)
            {
               _loc16_.isLearn = 1;
            }
            _loc17_ = new ItemFace(_loc16_);
            _loc17_.x = 37 + 55 * _loc10_;
            _loc17_.y = 52 + 55 * _loc11_;
            _loc17_.setShowCount(false);
            this.skillContanier.addChild(_loc17_);
            _loc10_++;
            _loc12_++;
         }
         var _loc13_:Array = param8.split(",");
         var _loc14_:String = LanResManager.getLanCommonTextWords("属性加成：") + "<br>";
         _loc12_ = 0;
         while(_loc12_ < _loc13_.length)
         {
            _loc18_ = _loc13_[_loc12_].split(":");
            _loc14_ += this.typeName(_loc18_[0]) + "：" + _loc18_[1] + "<br>";
            _loc12_++;
         }
         if(param8 != "")
         {
            _loc14_ = _loc14_.substr(0,_loc14_.length - 4);
         }
         this.ftValue.htmlText = _loc14_;
         if(param7 == 1)
         {
            this.check.selectState = true;
         }
         else
         {
            this.check.selectState = false;
         }
         this.ftDesc.htmlText = "<textformat leading=\'8\'>" + param5 + "</textformat>";
         if(param1 != -1)
         {
            this.setEnableFun();
         }
      }
      
      private function setSwf() : void
      {
         this.loadUrl = GameConfig.fileBaseFolder + "res/data/mc/rijinlun/rjl.swf";
         if(Boolean(this.gongMc) && this.gongMc.parent != null)
         {
            this.gongMc.stop();
            this.gongMc.parent.removeChild(this.gongMc);
         }
         while(this.gongMcSpr.numChildren > 0)
         {
            this.gongMcSpr.removeChildAt(0);
         }
         if(this.mcObj[0] != null)
         {
            this.gongMc = this.mcObj[0] as MovieClip;
            this.gongMc.play();
            this.gongMcSpr.addChild(this.gongMc);
         }
         else
         {
            LoaderManager.lazyLoad(function(param1:Event):void
            {
               var _loc2_:LoadingItem = param1.target as LoadingItem;
               if(_loc2_.url.url != loadUrl)
               {
                  return;
               }
               if(Boolean(gongMc) && gongMc.parent != null)
               {
                  gongMc.stop();
                  gongMc.parent.removeChild(gongMc);
               }
               while(gongMcSpr.numChildren > 0)
               {
                  gongMcSpr.removeChildAt(0);
               }
               gongMc = _loc2_.content as MovieClip;
               mcObj[0] = gongMc;
               if(gongMc)
               {
                  gongMcSpr.addChild(gongMc);
               }
            },null,false,this.loadUrl);
         }
      }
      
      public function showRijinlun(param1:int) : void
      {
         if(param1 == 0)
         {
            this.check.selectState = false;
         }
         else if(param1 == 1)
         {
            this.check.selectState = true;
         }
         else if(param1 == 2)
         {
            this.check.selectState = false;
         }
      }
      
      public function showTuPoPanel(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.rijinlunTupo.x == 138)
            {
               TweenMax.to(this.rijinlunTupo,1,{"x":410});
               this.tupoBo = true;
               this.tupoBtn.enabled = false;
               this.preBtn.enabled = false;
               this.nextBtn.enabled = false;
            }
         }
         else
         {
            if(this.rijinlunTupo.x == 410)
            {
               TweenMax.to(this.rijinlunTupo,1,{"x":138});
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_RIJINLUN_ZIDONGTISHENG_CLICK,"",false));
            }
            this.tupoBo = false;
            this.tupoBtn.enabled = true;
            if(this.lookingId != 1)
            {
               this.preBtn.enabled = true;
            }
            if(this.lookingId != 6)
            {
               this.nextBtn.enabled = true;
            }
         }
      }
      
      public function isTupoCanvasShow() : Boolean
      {
         if(this.rijinlunTupo.x == 410)
         {
            return true;
         }
         return false;
      }
      
      public function setTupoInit(param1:String, param2:String, param3:Boolean, param4:String, param5:int, param6:Boolean, param7:int) : void
      {
         this.rijinlunTupo.setTupoInit(param1,param2,param3,param4,param5,param6,param7);
      }
      
      public function setZhufuzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this.rijinlunTupo.setZhufuzhi(param1,param2,param3);
      }
      
      public function setGoods(param1:Goods, param2:Boolean) : void
      {
         this.rijinlunTupo.setGoods(param1,param2);
      }
      
      public function setTuPoBtn(param1:Boolean) : void
      {
         this.rijinlunTupo.setTuPoBtn(param1);
      }
      
      public function setEnableFun() : void
      {
         this.feixingBtn.enabled = false;
         this.tupoBtn.enabled = false;
         this.check.enabled = false;
         this.preBtn.enabled = false;
         this.nextBtn.enabled = false;
      }
      
      public function set setParent(param1:DisplayObject) : void
      {
         this._$parent = param1;
         this.rijinlunTupo._parent2 = param1;
         this.rijinlunTupo._parent3 = this;
      }
      
      public function set_Rijinlun(param1:Array) : void
      {
         var _loc3_:Goods = null;
         var _loc4_:ItemFace = null;
         while(this.equipContainers.numChildren > 0)
         {
            this.equipContainers.removeChildAt(0);
         }
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            _loc3_ = param1[_loc2_] as Goods;
            _loc4_ = new ItemFace(_loc3_);
            if(_loc3_.res.position == ItemPositionRange.POSTION_MINGYUEZHANG)
            {
               this.kuangHD = StaticValue.getBitmapByClassName("ui.tiem.slot");
               this.equipContainers.addChild(this.kuangHD);
               this.kuangHD.x = 0;
               this.kuangHD.y = 0;
               _loc4_.x = 2;
               _loc4_.y = 2;
               this.equipContainers.addChild(_loc4_);
            }
            _loc2_++;
         }
      }
   }
}

