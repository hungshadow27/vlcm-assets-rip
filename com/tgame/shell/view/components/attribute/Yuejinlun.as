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
   import com.tgame.common.GameState;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.utils.ToolTips;
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
   
   public class Yuejinlun extends Sprite
   {
      
      public static const UI_YUEJINLUN_GUANBI_CLICK:String = "UI_YUEJINLUN_GUANBI_CLICK";
      
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
      
      private var mcObj:Object;
      
      private var loadUrl:String;
      
      private var yuejinlunTupo:YuejinlunTupoCanvas;
      
      private var fts1:FTextArea;
      
      private var riyinSpr:Sprite;
      
      private var riyin:MovieClip;
      
      private var yuezhouSpr:Sprite;
      
      private var yuezhou:MovieClip;
      
      private var xingchenSpr:Sprite;
      
      private var xingchen:MovieClip;
      
      public function Yuejinlun()
      {
         var line:Bitmap;
         var $mask:Sprite;
         var cas:FCanvas = null;
         var loadUrl1:String = null;
         var loadUrl2:String = null;
         var loadUrl3:String = null;
         this.mcObj = {};
         super();
         cas = new FCanvas();
         cas.skin = "box_transparence";
         cas.x = 0;
         cas.y = 0;
         cas.width = 405;
         cas.height = 365;
         addChild(cas);
         this.bgSpr = new Sprite();
         addChild(this.bgSpr);
         this.gongMcSpr = new Sprite();
         this.gongMcSpr.x = 2;
         this.gongMcSpr.y = 3;
         addChild(this.gongMcSpr);
         this.feixingBtn = new FSimpleButton();
         addChild(this.feixingBtn);
         this.feixingBtn.x = 70 + 86;
         this.feixingBtn.y = 190 + 14 + 8;
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
         this.preBtn.x = 240 + 50 - 45 - 16 - 116 + 37 + 5 - 138 - 2;
         this.preBtn.y = 205 + 25 - 20 + 25 - 10 - 17 + 6 + 2 - 3 + 8;
         this.preBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.tf = new TextFormat();
         this.tf.align = "center";
         this.ftaName = new FTextArea();
         with(this.ftaName)
         {
            filters = StaticValue.filter;
            x = 175 - 138;
            y = 230 - 20 + 25 - 10 - 17 + 6 + 2 - 3 + 8;
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
         this.nextBtn.x = 240 + 50 - 45 - 16 + 5 + 99 - 138 - 101 - 5;
         this.nextBtn.y = 205 + 25 - 20 + 25 - 10 - 17 + 6 + 2 - 5 + 8;
         this.nextBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.tupoBtn = new SecondButton();
         this.tupoBtn.x = 240 + 50 - 45 - 16 + 100;
         this.tupoBtn.y = 205 + 25 - 20 + 25 - 10 - 17 + 6 + 2 - 3 - 5 + 8;
         this.tupoBtn.label = LanResManager.getLanCommonTextWords("开始领悟");
         this.tupoBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         addChild(this.tupoBtn);
         this.ftDesc = new FTextArea();
         this.ftDesc.x = 8;
         this.ftDesc.y = 258;
         this.ftDesc.htmlText = "";
         this.ftDesc.textColor = StaticValue.WHITE;
         addChild(this.ftDesc);
         this.ftDesc.width = 172;
         this.ftDesc.height = 106;
         this.ftDesc.wordWrap = true;
         this.ftValue = new FTextArea();
         this.ftValue.textColor = StaticValue.GREEN;
         this.ftValue.autoSize = TextFieldAutoSize.LEFT;
         addChild(this.ftValue);
         this.ftValue.x = 210 + 13 - 44 + 10;
         this.ftValue.y = 258;
         this.skillContanier = new Sprite();
         this.skillContanier.x = 240 + 75;
         this.skillContanier.y = 259;
         addChild(this.skillContanier);
         line = StaticValue.getBitmapByClassName("ui.line");
         line.x = 240;
         line.y;
         addChild(line);
         this.check = new FCheckBox();
         addChild(this.check);
         this.check.x = 315 + 2;
         this.check.y = 340;
         this.check.enabled = true;
         this.check.text = LanResManager.getLanCommonTextWords("显示外观");
         this.check.textColor = StaticValue.WHITE;
         this.check.addEventListener(MouseEvent.CLICK,this.onClick);
         this.yuejinlunTupo = new YuejinlunTupoCanvas();
         addChild(this.yuejinlunTupo);
         this.yuejinlunTupo.x = 138;
         this.yuejinlunTupo.y = -10;
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
         this.yuejinlunTupo.mask = $mask;
         addEventListener(UI_YUEJINLUN_GUANBI_CLICK,this.onCloseTupo);
         this.fts1 = new FTextArea();
         this.fts1.x = 10 + 260;
         this.fts1.y = 7;
         this.fts1.textColor = StaticValue.GREEN;
         this.fts1.width = 150;
         this.fts1.height = 20;
         this.fts1.htmlText = LanResManager.getLanCommonTextWords("日月合并秘籍(已激活)");
         this.fts1.visible = false;
         addChild(this.fts1);
         ToolTips.createToolTips(this.fts1,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("特珠属性：攻击58888亿防御52888亿血量50888亿暴击 58888闪避58888 所有武功1400000层") + "<br>" + LanResManager.getLanCommonTextWords("日月合并：激活日月合并的玩家，只需开启飞行模式后，即可100%触发日月神技，持续20秒，") + "<br>" + LanResManager.getLanCommonTextWords("可瞬间清除自身所有负面效果，且状态期间内免疫所有负面状态（可免疫人物和弟子所有城里") + "<br>" + LanResManager.getLanCommonTextWords("技能），且在该效果下，每受到一次攻击自身必定触发无敌3秒，可瞬间停止对手及侍从所有") + "<br>" + LanResManager.getLanCommonTextWords("攻击。冷却60秒。") + "<br>";
            return _loc1_ + "</font></textformat>";
         });
         this.riyinSpr = new Sprite();
         addChild(this.riyinSpr);
         this.yuezhouSpr = new Sprite();
         addChild(this.yuezhouSpr);
         this.xingchenSpr = new Sprite();
         addChild(this.xingchenSpr);
         loadUrl1 = GameConfig.fileBaseFolder + "res/data/mc/yuejinlun/taiyang.swf";
         this.riyin = new MovieClip();
         LoaderManager.lazyLoad(function(param1:Event):void
         {
            var _loc2_:LoadingItem = param1.target as LoadingItem;
            if(_loc2_.url.url != loadUrl1)
            {
               return;
            }
            riyin = _loc2_.content as MovieClip;
            if(riyin)
            {
               riyin.visible = false;
               riyin.play();
               riyin.x = 5 + 20;
               riyin.y = 31 - 25 - 4;
               riyinSpr.addChild(riyin);
            }
         },null,false,loadUrl1);
         ToolTips.createToolTips(this.riyinSpr,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("日印 ：激活日印的玩家，可开启月金轮日印特效技能。攻击时有几率触发日印，持续10秒；") + "<br>" + LanResManager.getLanCommonTextWords("在此状态下，每攻击对手一次，对手都将瞬间失去所有能力，持续10秒。") + "<br>";
            return _loc1_ + "</font></textformat>";
         });
         loadUrl2 = GameConfig.fileBaseFolder + "res/data/mc/yuejinlun/yueliang.swf";
         this.yuezhou = new MovieClip();
         LoaderManager.lazyLoad(function(param1:Event):void
         {
            var _loc2_:LoadingItem = param1.target as LoadingItem;
            if(_loc2_.url.url != loadUrl2)
            {
               return;
            }
            yuezhou = _loc2_.content as MovieClip;
            if(yuezhou)
            {
               yuezhou.visible = false;
               yuezhou.play();
               yuezhou.x = 35 - 20 - 12;
               yuezhou.y = 31 + 20 - 15;
               yuezhouSpr.addChild(yuezhou);
            }
         },null,false,loadUrl2);
         ToolTips.createToolTips(this.yuezhouSpr,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("月咒 ：激活月咒的玩家，可开启月金轮月咒特效技能。被攻击时有几率触发月咒，持续10秒；") + "<br>" + LanResManager.getLanCommonTextWords("在此状态下，每受到一次攻击，都将反噬对手一个咒印，使其瞬间定身于原地，持续10秒。") + "<br>";
            return _loc1_ + "</font></textformat>";
         });
         loadUrl3 = GameConfig.fileBaseFolder + "res/data/mc/yuejinlun/xing.swf";
         this.xingchen = new MovieClip();
         LoaderManager.lazyLoad(function(param1:Event):void
         {
            var _loc2_:LoadingItem = param1.target as LoadingItem;
            if(_loc2_.url.url != loadUrl3)
            {
               return;
            }
            xingchen = _loc2_.content as MovieClip;
            if(xingchen)
            {
               xingchen.visible = false;
               xingchen.play();
               xingchen.x = 35 + 20 - 55;
               xingchen.y = 31 + 40 + 17;
               xingchenSpr.addChild(xingchen);
            }
         },null,false,loadUrl3);
         ToolTips.createToolTips(this.xingchenSpr,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("星辰 ：激活星辰的玩家，可开启月金轮星辰特效技能。攻击时有几率触发星辰，持续10秒；") + "<br>" + LanResManager.getLanCommonTextWords("对手在此状态下，将失去一切操作，使用任何技能，使用操作动作都失效。") + "<br>";
            return _loc1_ + "</font></textformat>";
         });
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
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_YUEJINLUN_FEIXING_CLICK));
               break;
            case this.tupoBtn:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_YUEJINLUN_LINGWU_SHOW,"",this.nowId));
               break;
            case this.preBtn:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_YUEJINLUN_HUANYE_CLICK,"",this.lookingId - 1));
               break;
            case this.nextBtn:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_YUEJINLUN_HUANYE_CLICK,"",this.lookingId + 1));
         }
         switch(param1.currentTarget)
         {
            case this.check:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_YUEJINLUN_WAIGUAN_CLICK,"",this.check.selectState));
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
               _loc2_ = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("展翅凌空将在月金轮升至六阶时可使用，使用本功能后玩家将进入飞行状态，") + "<br>" + LanResManager.getLanCommonTextWords("飞行时玩家的闪避将大幅提升！飞行时将消耗一定的体力值。") + "</textformat>";
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
      
      public function setData(param1:Boolean, param2:int, param3:int, param4:int, param5:String, param6:String, param7:String, param8:int, param9:String) : void
      {
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc16_:Array = null;
         var _loc17_:Bitmap = null;
         var _loc18_:Skill = null;
         var _loc19_:ItemFace = null;
         var _loc20_:Array = null;
         this.setJiHuo(param1);
         if(param3 != 6)
         {
            this.feixingBtn.enabled = false;
            this.check.enabled = false;
         }
         else
         {
            this.feixingBtn.enabled = true;
            this.check.enabled = true;
         }
         this.lookingId = param4;
         this.nowId = param3;
         this.setSwf(param4);
         while(this.skillContanier.numChildren > 0)
         {
            this.skillContanier.removeChildAt(0);
         }
         if(param4 <= 1)
         {
            this.preBtn.enabled = false;
         }
         else
         {
            this.preBtn.enabled = true;
         }
         if(param4 == 6)
         {
            this.nextBtn.enabled = false;
         }
         else
         {
            this.nextBtn.enabled = true;
         }
         this.ftaName.htmlText = param5;
         if(param3 >= param4 && param4 >= 0 || param3 == 6)
         {
            this.tupoBtn.label = LanResManager.getLanCommonTextWords("已领悟");
            this.tupoBtn.enabled = false;
         }
         else if(param3 + 1 == param4)
         {
            this.tupoBtn.label = LanResManager.getLanCommonTextWords("开始领悟");
            this.tupoBtn.enabled = true;
         }
         else
         {
            this.tupoBtn.label = LanResManager.getLanCommonTextWords("未领悟");
            this.tupoBtn.enabled = false;
         }
         var _loc10_:Array = param7.split(",");
         _loc13_ = 0;
         while(_loc13_ < _loc10_.length)
         {
            if(_loc13_ == 0)
            {
               _loc11_ = 0;
               _loc12_ = 0;
            }
            else if(_loc13_ == 1)
            {
               _loc11_ = 40;
               _loc12_ = 0;
            }
            else
            {
               _loc11_ = 18;
               _loc12_ = 40;
            }
            _loc16_ = _loc10_[_loc13_].split(":");
            _loc17_ = StaticValue.getBitmapByClassName("ui.tiem.slot");
            _loc17_.x = _loc11_;
            _loc17_.y = _loc12_;
            this.skillContanier.addChild(_loc17_);
            _loc18_ = new Skill(_loc16_[0]);
            _loc18_.isLearn = int(_loc16_[1]);
            _loc19_ = new ItemFace(_loc18_);
            if(_loc18_.isLearn)
            {
               _loc19_.filters = [];
            }
            else
            {
               _loc19_.filters = Tools.blackWhiteFilter;
            }
            _loc19_.x = _loc11_ + 2;
            _loc19_.y = _loc12_ + 2;
            _loc19_.setShowCount(false);
            this.skillContanier.addChild(_loc19_);
            _loc13_++;
         }
         var _loc14_:Array = param9.split(",");
         var _loc15_:String = LanResManager.getLanCommonTextWords("属性加成：") + "<br>";
         _loc13_ = 0;
         while(_loc13_ < _loc14_.length)
         {
            _loc20_ = _loc14_[_loc13_].split(":");
            _loc15_ += this.typeName(_loc20_[0]) + "：" + _loc20_[1] + "<br>";
            _loc13_++;
         }
         this.ftValue.htmlText = _loc15_;
         if(param8 == 1)
         {
            this.check.selectState = true;
         }
         else
         {
            this.check.selectState = false;
         }
         this.ftDesc.htmlText = "<textformat leading=\'8\'>" + param6 + "</textformat>";
         if(param2 != -1)
         {
            this.setEnableFun();
         }
      }
      
      private function setSwf(param1:int) : void
      {
         var lookID:int = param1;
         this.loadUrl = GameConfig.fileBaseFolder + "res/data/mc/yuejinlun/" + lookID + ".swf";
         if(Boolean(this.gongMc) && this.gongMc.parent != null)
         {
            this.gongMc.stop();
            this.gongMc.parent.removeChild(this.gongMc);
         }
         while(this.gongMcSpr.numChildren > 0)
         {
            this.gongMcSpr.removeChildAt(0);
         }
         if(this.mcObj[lookID] != null)
         {
            this.gongMc = this.mcObj[lookID] as MovieClip;
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
               mcObj[lookID] = gongMc;
               if(gongMc)
               {
                  gongMcSpr.addChild(gongMc);
               }
            },null,false,this.loadUrl);
         }
      }
      
      public function showYuejinlun(param1:int) : void
      {
         if(param1 == 0)
         {
            this.check.selectState = false;
         }
         else if(param1 == 1)
         {
            this.check.selectState = true;
         }
      }
      
      public function showTuPoPanel(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.yuejinlunTupo.x == 138)
            {
               TweenMax.to(this.yuejinlunTupo,1,{"x":410});
               this.tupoBo = true;
               this.tupoBtn.enabled = false;
               this.preBtn.enabled = false;
               this.nextBtn.enabled = false;
            }
         }
         else
         {
            if(this.yuejinlunTupo.x == 410)
            {
               TweenMax.to(this.yuejinlunTupo,1,{"x":138});
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_YUEJINLUN_ZIDONGTISHENG_CLICK,"",false));
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
         if(this.yuejinlunTupo.x == 410)
         {
            return true;
         }
         return false;
      }
      
      public function setTupoInit(param1:String, param2:String, param3:Boolean, param4:String, param5:int, param6:Boolean, param7:int) : void
      {
         this.yuejinlunTupo.setTupoInit(param1,param2,param3,param4,param5,param6,param7);
      }
      
      public function setZhufuzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this.yuejinlunTupo.setZhufuzhi(param1,param2,param3);
      }
      
      public function setGoods(param1:Goods, param2:Boolean) : void
      {
         this.yuejinlunTupo.setGoods(param1,param2);
      }
      
      public function setTuPoBtn(param1:Boolean) : void
      {
         this.yuejinlunTupo.setTuPoBtn(param1);
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
         this.yuejinlunTupo._parent2 = param1;
         this.yuejinlunTupo._parent3 = this;
      }
      
      public function setJiHuo(param1:Boolean) : void
      {
         if(param1)
         {
            this.fts1.visible = GameState.dictMainStatus[SpecialGoodsID.YUEJINLUN_RIYUEHEBING_ID];
            this.riyin.visible = GameState.dictMainStatus[SpecialGoodsID.YUEJINLUN_RI_ID];
            this.yuezhou.visible = GameState.dictMainStatus[SpecialGoodsID.YUEJINLUN_YUE_ID];
            this.xingchen.visible = GameState.dictMainStatus[SpecialGoodsID.YUEJINLUN_XING_ID];
         }
         else
         {
            this.fts1.visible = GameState.dictTargetStatus[SpecialGoodsID.YUEJINLUN_RIYUEHEBING_ID];
            this.riyin.visible = GameState.dictTargetStatus[SpecialGoodsID.YUEJINLUN_RI_ID];
            this.yuezhou.visible = GameState.dictTargetStatus[SpecialGoodsID.YUEJINLUN_YUE_ID];
            this.xingchen.visible = GameState.dictTargetStatus[SpecialGoodsID.YUEJINLUN_XING_ID];
         }
      }
   }
}

