package com.tgame.shell.view.components.attribute
{
   import br.com.stimuli.loading.loadingtypes.LoadingItem;
   import com.fireice.button.FSimpleButton;
   import com.fireice.checkBox.FCheckBox;
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FTextArea;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameState;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.common.utils.ToolTips;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.common.vo.item.Skill;
   import com.tgame.moudels.taohuazhen.model.info.TaoHuaZhenVO;
   import com.tgame.shell.view.components.CharAttribute;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.manager.LoaderManager;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.text.TextFormat;
   import gs.TweenMax;
   
   public class TaoHuaZhen extends Sprite
   {
      
      public static const UI_TAOHUAZHEN_GUANBI_CLICK:String = "UI_TAOHUAZHEN_GUANBI_CLICK";
      
      private var bg:DisplayObject;
      
      private var shangyiyeButton:FSimpleButton;
      
      private var xiayiyeButton:FSimpleButton;
      
      private var cengshu:FTextArea;
      
      private var tishengBtn:SecondButton;
      
      private var shuxing:FTextArea;
      
      private var miaoshu:FTextArea;
      
      private var taohuazhen:TaoHuaZhenTupoCanvas;
      
      private var _$parent:DisplayObject;
      
      public const TAOHUAZHEN_MAX:int = 8;
      
      private var nowId:int;
      
      private var lookingId:int;
      
      private var tupoBo:Boolean = false;
      
      private var qiuSpr:Sprite;
      
      private var qiuArrX:Array;
      
      private var qiuArrY:Array;
      
      private var qiu1:DisplayObject;
      
      private var qiu2:DisplayObject;
      
      private var qiu3:DisplayObject;
      
      private var qiu4:DisplayObject;
      
      private var qiu5:DisplayObject;
      
      private var qiu6:DisplayObject;
      
      private var qiu7:DisplayObject;
      
      private var qiu8:DisplayObject;
      
      private var TCball1:MovieClip;
      
      private var TCball2:MovieClip;
      
      private var TCball3:MovieClip;
      
      private var TCball4:MovieClip;
      
      private var TCball5:MovieClip;
      
      private var TCball6:MovieClip;
      
      private var TCball7:MovieClip;
      
      private var TCball8:MovieClip;
      
      private var mcObj:Array;
      
      private var bloodMcSpr:Sprite;
      
      private var kuang:Bitmap;
      
      private var jinengSpr:Sprite;
      
      private var tf:TextFormat;
      
      private var fts1:FTextArea;
      
      private var taohuashi:int = 0;
      
      private var fts2:FTextArea;
      
      private var mainSkillContainer:Sprite;
      
      private var currSkill:ItemFace;
      
      private var p:Point;
      
      private var mainSkillItemFace:ItemFace;
      
      private var mainSkill:Skill;
      
      private var kuang1:Bitmap;
      
      private var fts3:FTextArea;
      
      private var lingjiugongji:Boolean = false;
      
      private var lingjiufangyu:Boolean = false;
      
      private var tianlongshi:int = 0;
      
      private var xuanwushi:int = 0;
      
      private var fts4:FTextArea;
      
      private var checkHz:FCheckBox;
      
      public function TaoHuaZhen()
      {
         var title:FTextArea;
         var fjjn:FTextArea;
         var $mask:Sprite;
         var box:FCanvas = null;
         var loadUrl:String = null;
         this.qiuArrX = [];
         this.qiuArrY = [];
         super();
         this.tf = new TextFormat();
         this.tf.align = "center";
         box = new FCanvas();
         box.skin = "box";
         addChild(box);
         box.x = 0;
         box.y = 0;
         box.width = 403;
         box.height = 366;
         box = new FCanvas();
         box.skin = "box";
         addChild(box);
         box.x = 2;
         box.y = 231 + 32 - 25 - 2;
         box.width = 400;
         box.height = 135 - 32 + 25 + 2;
         this.bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/taohuazhen/bg.swf");
         this.bg.x = 2;
         this.bg.y = 2;
         addChild(this.bg);
         this.qiuArrX = new Array(186,247,273,247,186,124,100,120);
         this.qiuArrY = new Array(5,30,92,155,180,155,91,30);
         this.bloodMcSpr = new Sprite();
         this.bloodMcSpr.x = 0;
         this.bloodMcSpr.y = 0;
         addChild(this.bloodMcSpr);
         loadUrl = GameConfig.fileBaseFolder + "res/ui/UIditu/taohuazhen/dian.swf";
         this.TCball1 = new MovieClip();
         LoaderManager.lazyLoad(function(param1:Event):void
         {
            var _loc2_:LoadingItem = param1.target as LoadingItem;
            if(_loc2_.url.url != loadUrl)
            {
               return;
            }
            TCball1 = _loc2_.content as MovieClip;
            if(TCball1)
            {
               TCball1.visible = false;
               TCball1.stop();
               bloodMcSpr.addChildAt(TCball1,0);
            }
         },null,false,loadUrl);
         this.TCball2 = new MovieClip();
         LoaderManager.lazyLoad(function(param1:Event):void
         {
            var _loc2_:LoadingItem = param1.target as LoadingItem;
            if(_loc2_.url.url != loadUrl)
            {
               return;
            }
            TCball2 = _loc2_.content as MovieClip;
            if(TCball2)
            {
               TCball2.visible = false;
               TCball2.stop();
               bloodMcSpr.addChildAt(TCball2,0);
            }
         },null,false,loadUrl);
         this.TCball3 = new MovieClip();
         LoaderManager.lazyLoad(function(param1:Event):void
         {
            var _loc2_:LoadingItem = param1.target as LoadingItem;
            if(_loc2_.url.url != loadUrl)
            {
               return;
            }
            TCball3 = _loc2_.content as MovieClip;
            if(TCball3)
            {
               TCball3.visible = false;
               TCball3.stop();
               bloodMcSpr.addChildAt(TCball3,0);
            }
         },null,false,loadUrl);
         this.TCball4 = new MovieClip();
         LoaderManager.lazyLoad(function(param1:Event):void
         {
            var _loc2_:LoadingItem = param1.target as LoadingItem;
            if(_loc2_.url.url != loadUrl)
            {
               return;
            }
            TCball4 = _loc2_.content as MovieClip;
            if(TCball4)
            {
               TCball4.visible = false;
               TCball4.stop();
               bloodMcSpr.addChildAt(TCball4,0);
            }
         },null,false,loadUrl);
         this.TCball5 = new MovieClip();
         LoaderManager.lazyLoad(function(param1:Event):void
         {
            var _loc2_:LoadingItem = param1.target as LoadingItem;
            if(_loc2_.url.url != loadUrl)
            {
               return;
            }
            TCball5 = _loc2_.content as MovieClip;
            if(TCball5)
            {
               TCball5.visible = false;
               TCball5.stop();
               bloodMcSpr.addChildAt(TCball5,0);
            }
         },null,false,loadUrl);
         this.TCball6 = new MovieClip();
         LoaderManager.lazyLoad(function(param1:Event):void
         {
            var _loc2_:LoadingItem = param1.target as LoadingItem;
            if(_loc2_.url.url != loadUrl)
            {
               return;
            }
            TCball6 = _loc2_.content as MovieClip;
            if(TCball6)
            {
               TCball6.visible = false;
               TCball6.stop();
               bloodMcSpr.addChildAt(TCball6,0);
            }
         },null,false,loadUrl);
         this.TCball7 = new MovieClip();
         LoaderManager.lazyLoad(function(param1:Event):void
         {
            var _loc2_:LoadingItem = param1.target as LoadingItem;
            if(_loc2_.url.url != loadUrl)
            {
               return;
            }
            TCball7 = _loc2_.content as MovieClip;
            if(TCball7)
            {
               TCball7.visible = false;
               TCball7.stop();
               bloodMcSpr.addChildAt(TCball7,0);
            }
         },null,false,loadUrl);
         this.TCball8 = new MovieClip();
         LoaderManager.lazyLoad(function(param1:Event):void
         {
            var _loc2_:LoadingItem = param1.target as LoadingItem;
            if(_loc2_.url.url != loadUrl)
            {
               return;
            }
            TCball8 = _loc2_.content as MovieClip;
            if(TCball8)
            {
               TCball8.visible = false;
               TCball8.stop();
               bloodMcSpr.addChildAt(TCball8,0);
            }
         },null,false,loadUrl);
         this.qiuSpr = new Sprite();
         this.qiuSpr.x = 0;
         this.qiuSpr.y = 0;
         addChild(this.qiuSpr);
         this.shangyiyeButton = new FSimpleButton();
         this.shangyiyeButton.skin = "previousButton";
         addChild(this.shangyiyeButton);
         this.shangyiyeButton.x = 240 + 50 - 45 - 16 - 116 + 37;
         this.shangyiyeButton.y = 205 + 25 - 20 + 25 - 10 - 17;
         this.shangyiyeButton.addEventListener(MouseEvent.CLICK,this.onClick);
         this.cengshu = new FTextArea();
         addChild(this.cengshu);
         this.cengshu.defaultTextFormat = this.tf;
         this.cengshu.background = true;
         this.cengshu.backgroundColor = 1186072;
         this.cengshu.width = 59;
         this.cengshu.height = 17;
         this.cengshu.x = 170;
         this.cengshu.y = 230 - 20 + 25 - 10 - 17;
         this.xiayiyeButton = new FSimpleButton();
         this.xiayiyeButton.skin = "nextButton";
         addChild(this.xiayiyeButton);
         this.xiayiyeButton.x = 240 + 50 - 45 - 16;
         this.xiayiyeButton.y = 205 + 25 - 20 + 25 - 10 - 17;
         this.xiayiyeButton.addEventListener(MouseEvent.CLICK,this.onClick);
         this.tishengBtn = new SecondButton();
         addChild(this.tishengBtn);
         this.tishengBtn.x = 240 + 50;
         this.tishengBtn.y = 205 + 25 - 20 + 25 - 10 - 17;
         this.tishengBtn.label = LanResManager.getLanCommonTextWords("领悟本层");
         this.tishengBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         title = new FTextArea();
         title.multiline = true;
         title.filters = StaticValue.filter;
         title.width = 100;
         title.height = 110;
         title.x = 70;
         title.y = 240;
         title.textColor = StaticValue.ORANGE;
         title.htmlText = "<textformat leading=\'50\'><font size = \'16\' color=\'" + StaticValue.ORANGE_RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("玄铁剑法") + "</font></textformat>";
         this.miaoshu = new FTextArea();
         addChild(this.miaoshu);
         this.miaoshu.multiline = true;
         this.miaoshu.wordWrap = true;
         this.miaoshu.width = 160 + 40;
         this.miaoshu.height = 110 + 20;
         this.miaoshu.x = 30 - 20;
         this.miaoshu.y = 260 - 10;
         this.miaoshu.htmlText = "<font color=\'" + StaticValue.BlUE20_HTML + "\'>" + LanResManager.getLanCommonTextWords("江湖绝技，使用后，可立即解除自身大部分减益状态。纵横江湖，自在逍遥，必备神技。") + "</font>";
         this.shuxing = new FTextArea();
         this.shuxing.multiline = true;
         this.shuxing.filters = StaticValue.filter;
         this.shuxing.width = 100 + 100;
         this.shuxing.height = 110;
         this.shuxing.x = 210 + 13;
         this.shuxing.y = 250 - 3 - 25 + 30;
         this.shuxing.textColor = StaticValue.ORANGE;
         addChild(this.shuxing);
         fjjn = new FTextArea();
         fjjn.multiline = true;
         fjjn.filters = StaticValue.filter;
         fjjn.width = 100;
         fjjn.height = 110;
         fjjn.x = 205 + 112 - 9 + 36;
         fjjn.y = 255 + 5 + 5 + 6 + 22;
         fjjn.textColor = StaticValue.ORANGE;
         fjjn.htmlText = "<textformat leading=\'50\'><font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("附加技能") + "</font></textformat>";
         addChild(fjjn);
         this.kuang = StaticValue.getBitmapByClassName("ui.tiem.slot");
         addChild(this.kuang);
         this.kuang.x = 325 - 2 + 33;
         this.kuang.y = 300 - 2 + 20;
         this.jinengSpr = new Sprite();
         this.jinengSpr.x = 325 + 33;
         this.jinengSpr.y = 300 + 20;
         addChild(this.jinengSpr);
         this.taohuazhen = new TaoHuaZhenTupoCanvas();
         addChild(this.taohuazhen);
         this.taohuazhen.x = 138;
         this.taohuazhen.y = 0;
         $mask = new Sprite();
         $mask.mouseEnabled = false;
         addChild($mask);
         $mask.x = 410;
         $mask.y = -5;
         with($mask.graphics)
         {
            beginFill(16711680,0.5);
            drawRect(0,0,500,390);
            endFill();
         }
         this.taohuazhen.mask = $mask;
         addEventListener(UI_TAOHUAZHEN_GUANBI_CLICK,this.onCloseTupo);
         this.mcObj = new Array();
         this.fts1 = new FTextArea();
         this.fts1.x = 10;
         this.fts1.y = 7;
         this.fts1.textColor = StaticValue.GREEN;
         this.fts1.width = 170 + 20;
         this.fts1.height = 20;
         this.fts1.htmlText = LanResManager.getLanCommonTextWords("桃花阵隐藏心法秘籍（已激活）");
         this.fts1.visible = false;
         addChild(this.fts1);
         ToolTips.createToolTips(this.fts1,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("提升属性：攻击：56888亿、防御52888亿、血量60888亿、所有武功提升 480000层") + "<br>" + LanResManager.getLanCommonTextWords("特殊属性：激活该秘籍后，可使用桃花石进行养成属性，每次可增加攻击100亿，所有武功提升20000层！（最多可养成500次！）") + "<br>" + LanResManager.getLanCommonTextWords("当前已加成") + taohuashi + LanResManager.getLanCommonTextWords("次") + "<br>" + LanResManager.getLanCommonTextWords("攻击") + taohuashi * 100 + LanResManager.getLanCommonTextWords("亿，所有武功提升") + taohuashi * 20000 + LanResManager.getLanCommonTextWords("层") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.fts2 = new FTextArea();
         this.fts2.x = 10 + 214;
         this.fts2.y = 7;
         this.fts2.textColor = StaticValue.GREEN;
         this.fts2.width = 170;
         this.fts2.height = 20;
         this.fts2.htmlText = LanResManager.getLanCommonTextWords("桃花阵隐藏阵技秘籍(已激活)");
         addChild(this.fts2);
         ToolTips.createToolTips(this.fts2,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("攻击：56888亿、防御52888亿、血量60888亿、所有武功提升 480000层") + "<br>" + LanResManager.getLanCommonTextWords("桃花护体（特殊技能）：双击使用桃花护体技能，可获得桃花缠绕自身，持续十分钟，") + "<br>" + LanResManager.getLanCommonTextWords("在此状态下，花瓣将凝结成护盾附于已身，所有攻击伤害都将减免80%，且在每次攻击") + "<br>" + LanResManager.getLanCommonTextWords("都有几率使对手禁武5秒！") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.kuang1 = StaticValue.getBitmapByClassName("ui.tiem.slot");
         addChild(this.kuang1);
         this.kuang1.x = 25 + 324;
         this.kuang1.y = 160 + 35 - 186 + 16;
         this.mainSkillContainer = new Sprite();
         this.mainSkillContainer.x = 25 + 2 + 324;
         this.mainSkillContainer.y = 160 + 2 + 35 - 186 + 16;
         addChild(this.mainSkillContainer);
         this.mainSkillContainer.addEventListener(MouseEvent.MOUSE_DOWN,this.onSkillMouseDown);
         this.mainSkillContainer.addEventListener(MouseEvent.MOUSE_UP,this.onSkillMouseUp);
         this.fts3 = new FTextArea();
         this.fts3.x = 10;
         this.fts3.y = 7 + 20;
         this.fts3.textColor = StaticValue.GREEN;
         this.fts3.width = 170 + 20;
         this.fts3.height = 20 + 20;
         this.fts3.htmlText = LanResManager.getLanCommonTextWords("天山折梅手心法") + "<br>" + LanResManager.getLanCommonTextWords("（已激活）");
         this.fts3.visible = false;
         addChild(this.fts3);
         ToolTips.createToolTips(this.fts3,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("提升属性：攻击：56888亿、防御52888亿、血量60888亿、所有武功提升 480000层") + "<br>" + LanResManager.getLanCommonTextWords("天山折梅手（特殊技能）：传闻为天山童姥出名绝技，攻击时有几率触发天山折梅手状态，持续60") + "<br>" + LanResManager.getLanCommonTextWords("秒。在此状态下，每过3秒，必定废除对手身上随机10个勋章，冷却60秒！") + "<br>";
            if(lingjiugongji)
            {
               _loc1_ += LanResManager.getLanCommonTextWords("灵鹫攻击掌法：只有激活天山折梅手心法的玩家方可使用，使用后可开启灵鹫攻击掌法养成功能。") + "<br>" + LanResManager.getLanCommonTextWords("养成属性：可用天龙石养成，每次养成增加一层掌法，最多可养成200次。（当攻击掌法层数大于抵") + "<br>" + LanResManager.getLanCommonTextWords("抗掌法层数，攻击时必定令对手命中天山折梅心法技能）") + "<br>" + LanResManager.getLanCommonTextWords("当前已养成") + tianlongshi + LanResManager.getLanCommonTextWords("次") + "<br>";
            }
            if(lingjiufangyu)
            {
               _loc1_ += LanResManager.getLanCommonTextWords("灵鹫抵抗掌法：只有激活天山折梅手心法的玩家方可使用，使用后可开启灵鹫抵抗掌法养成功能。") + "<br>" + LanResManager.getLanCommonTextWords("养成属性：可用玄龟石养成，每次养成增加一层掌法，最多可养成200次。（当抵抗掌法层数大于攻") + "<br>" + LanResManager.getLanCommonTextWords("击掌法层数，被攻击时必定不会命中天山折梅心法技能，当攻击掌法层数与抵抗掌法层数相同时，攻") + "<br>" + LanResManager.getLanCommonTextWords("击时将有几率触发天山折梅手状态）") + "<br>" + LanResManager.getLanCommonTextWords("当前已养成") + xuanwushi + LanResManager.getLanCommonTextWords("次") + "<br>";
            }
            return _loc1_ + "</textformat>";
         });
         this.fts4 = new FTextArea();
         this.fts4.x = 10;
         this.fts4.y = 7 + 20 + 20 + 15;
         this.fts4.textColor = StaticValue.GREEN;
         this.fts4.width = 110;
         this.fts4.height = 20;
         this.fts4.htmlText = LanResManager.getLanCommonTextWords("沙漠飞鹰秘籍");
         this.fts4.visible = false;
         addChild(this.fts4);
         ToolTips.createToolTips(this.fts4,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("攻击 68888亿、防御 60888亿、血量 80888亿、所有武功提升 880000层") + "<br>" + LanResManager.getLanCommonTextWords("沙漠飞鹰：沙漠流传侠客，沙漠飞鹰，拥有两把双刃刀，制敌无数，人物可转换该英雄。") + "<br>" + LanResManager.getLanCommonTextWords("双刀流：攻击时的几率触发双刀流，持续10秒；在此状态下，可瞬间施发双刀流，使对") + "<br>" + LanResManager.getLanCommonTextWords("手同时命中双刀瞬闪和双刀魔灵；双刀瞬闪效果下，可使对手所有勋章失效不在触发；") + "<br>" + LanResManager.getLanCommonTextWords("双刀魔灵效果下，可使对手心脏受到魔灵的束缚，无法使用任何技能，持续10秒；当状") + "<br>" + LanResManager.getLanCommonTextWords("态解除后，对手因流血过多造成原地眩晕，持续5秒。") + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.checkHz = new FCheckBox();
         addChild(this.checkHz);
         this.checkHz.visible = false;
         this.checkHz.x = 100;
         this.checkHz.y = 7 + 40 + 15;
         this.checkHz.addEventListener(MouseEvent.CLICK,this.onCheckClick);
      }
      
      private function onCheckClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.checkHz:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.checkHz.selectState,79]));
         }
      }
      
      private function fun(param1:MouseEvent) : void
      {
         this.qiu1.x = mouseX;
         this.qiu1.y = mouseY;
         this.miaoshu.htmlText = "<font  color=\'" + StaticValue.YELLOW_HTML + "\'>" + mouseX + "---" + mouseY + "</font>";
      }
      
      private function onCloseTupo(param1:BaseEvent) : void
      {
         this.showTuPoPanel(false);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.shangyiyeButton:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_TAOHUAZHEN_PREVIOUS_CLICK,"",this.lookingId - 1));
               break;
            case this.xiayiyeButton:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_TAOHUAZHEN_NEXT_CLICK,"",this.lookingId + 1));
               break;
            case this.tishengBtn:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_TAOHUAZHEN_TUPO_CLICK,"",this.lookingId));
               this.showTuPoPanel(true);
         }
      }
      
      public function set setParent(param1:DisplayObject) : void
      {
         this._$parent = param1;
         this.taohuazhen._parent2 = param1;
         this.taohuazhen._parent3 = this;
      }
      
      public function setinitilizeUI(param1:Boolean, param2:TaoHuaZhenVO) : void
      {
         this.setBg(param2.nowLookingID);
         this.setShuxingJiacheng(param2.miaoshu,param2.act,param2.def,param2.hp,param2.baoji,param2.shanbi);
         this.setZhaoShiMsg(param2.nowLookingName,param2.nowLookingID,param2.nowID);
         this.setSkill(param2.skillid,param2.isLearn);
         this.setJiHuo(param1);
         this.checkHz.selectState = param2.isHuanZhuang;
      }
      
      public function setJiHuo(param1:Boolean) : void
      {
         if(param1)
         {
            this.fts1.visible = GameState.dictMainStatus[SpecialGoodsID.TAOHUAZHEN_XINFA_ID];
            this.taohuashi = GameState.dictMainStatus[SpecialGoodsID.TAOHUAZHEN_TAOHUASHI_ID];
            this.fts2.visible = GameState.dictMainStatus[SpecialGoodsID.TAOHUAZHEN_YINCANG_ID];
            if(GameState.dictMainStatus[SpecialGoodsID.TAOHUAZHEN_YINCANG_ID])
            {
               this.setSkillJiHuo(200246,true);
               this.mainSkillContainer.visible = true;
               this.kuang1.visible = true;
            }
            else
            {
               this.mainSkillContainer.visible = false;
               this.kuang1.visible = false;
            }
            this.fts3.visible = GameState.dictMainStatus[SpecialGoodsID.TAOHUAZHEN_ZHEMEISHOU_ID];
            this.lingjiugongji = GameState.dictMainStatus[SpecialGoodsID.TAOHUAZHEN_LINGJIUGONGJI_ID];
            this.lingjiufangyu = GameState.dictMainStatus[SpecialGoodsID.TAOHUAZHEN_LINGJIUFANGYU_ID];
            this.tianlongshi = GameState.dictMainStatus[SpecialGoodsID.TAOHUAZHEN_TIANLONGSHI_ID];
            this.xuanwushi = GameState.dictMainStatus[SpecialGoodsID.TAOHUAZHEN_XUANWUSHI_ID];
            this.fts4.visible = GameState.dictMainStatus[SpecialGoodsID.TAOHUAZHEN_SHAMOFEIYING_ID];
            this.checkHz.visible = GameState.dictMainStatus[SpecialGoodsID.TAOHUAZHEN_SHAMOFEIYING_ID];
         }
         else
         {
            this.fts1.visible = GameState.dictTargetStatus[SpecialGoodsID.TAOHUAZHEN_XINFA_ID];
            this.taohuashi = GameState.dictTargetStatus[SpecialGoodsID.TAOHUAZHEN_TAOHUASHI_ID];
            this.fts2.visible = GameState.dictTargetStatus[SpecialGoodsID.TAOHUAZHEN_YINCANG_ID];
            if(GameState.dictTargetStatus[SpecialGoodsID.SANSHILIULUQINNASHOU_XIANGMODINGCHANJUE_ID])
            {
               this.setSkillJiHuo(200246,true);
               this.mainSkillContainer.visible = true;
               this.kuang1.visible = true;
            }
            else
            {
               this.mainSkillContainer.visible = false;
               this.kuang1.visible = false;
            }
            this.fts3.visible = GameState.dictTargetStatus[SpecialGoodsID.TAOHUAZHEN_ZHEMEISHOU_ID];
            this.lingjiugongji = GameState.dictTargetStatus[SpecialGoodsID.TAOHUAZHEN_LINGJIUGONGJI_ID];
            this.lingjiufangyu = GameState.dictTargetStatus[SpecialGoodsID.TAOHUAZHEN_LINGJIUFANGYU_ID];
            this.tianlongshi = GameState.dictTargetStatus[SpecialGoodsID.TAOHUAZHEN_TIANLONGSHI_ID];
            this.xuanwushi = GameState.dictTargetStatus[SpecialGoodsID.TAOHUAZHEN_XUANWUSHI_ID];
            this.fts4.visible = GameState.dictTargetStatus[SpecialGoodsID.TAOHUAZHEN_SHAMOFEIYING_ID];
            this.checkHz.visible = GameState.dictTargetStatus[SpecialGoodsID.TAOHUAZHEN_SHAMOFEIYING_ID];
         }
      }
      
      private function setBg(param1:int) : void
      {
         while(this.qiuSpr.numChildren > 0)
         {
            this.qiuSpr.removeChildAt(0);
         }
         var _loc2_:int = 0;
         while(_loc2_ < this.TAOHUAZHEN_MAX)
         {
            this["qiu" + String(_loc2_ + 1)] = null;
            if(_loc2_ < param1)
            {
               this["qiu" + String(_loc2_ + 1)] = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/taohuazhen/" + (_loc2_ + 1) + ".swf");
               this["TCball" + String(_loc2_ + 1)].visible = true;
               this["TCball" + String(_loc2_ + 1)].play();
            }
            else
            {
               this["qiu" + String(_loc2_ + 1)] = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/taohuazhen/0.swf");
               this["TCball" + String(_loc2_ + 1)].visible = false;
               this["TCball" + String(_loc2_ + 1)].stop();
            }
            this["qiu" + String(_loc2_ + 1)].x = this.qiuArrX[_loc2_];
            this["qiu" + String(_loc2_ + 1)].y = this.qiuArrY[_loc2_];
            this["TCball" + String(_loc2_ + 1)].x = this.qiuArrX[_loc2_] - 267;
            this["TCball" + String(_loc2_ + 1)].y = this.qiuArrY[_loc2_] - 219;
            this.qiuSpr.addChild(this["qiu" + String(_loc2_ + 1)]);
            _loc2_++;
         }
      }
      
      public function setShuxingJiacheng(param1:String, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number) : void
      {
         this.miaoshu.htmlText = "<font  color=\'" + StaticValue.YELLOW_HTML + "\'>" + param1 + "</font>";
         this.shuxing.htmlText = "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("人物属性加成") + "<br>" + LanResManager.getLanCommonTextWords("攻击:") + param2 + "<br>" + LanResManager.getLanCommonTextWords("防御:") + param3 + "<br>" + LanResManager.getLanCommonTextWords("生命:") + param4 + "<br>" + LanResManager.getLanCommonTextWords("暴击:") + param5 + "<br>" + LanResManager.getLanCommonTextWords("闪避:") + param6 + "</font>";
      }
      
      public function setZhaoShiMsg(param1:String, param2:int, param3:int = -1) : void
      {
         this.cengshu.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + param1 + "</font>";
         this.nowId = param3;
         this.lookingId = param2;
         if(this.tupoBo)
         {
            this.shangyiyeButton.enabled = false;
            this.tishengBtn.label = LanResManager.getLanCommonTextWords("阵法提升");
            this.tishengBtn.enabled = false;
            this.xiayiyeButton.enabled = false;
         }
         else
         {
            if(param2 <= 1)
            {
               this.shangyiyeButton.enabled = false;
            }
            else
            {
               this.shangyiyeButton.enabled = true;
            }
            if(param2 >= this.TAOHUAZHEN_MAX)
            {
               this.xiayiyeButton.enabled = false;
            }
            else
            {
               this.xiayiyeButton.enabled = true;
            }
            if(param2 < param3 + 1)
            {
               this.tishengBtn.label = LanResManager.getLanCommonTextWords("已领悟");
               this.tishengBtn.enabled = false;
            }
            else if(param2 == param3 + 1)
            {
               this.tishengBtn.label = LanResManager.getLanCommonTextWords("阵法提升");
               this.tishengBtn.enabled = true;
            }
            else if(param2 > param3 + 1)
            {
               this.tishengBtn.label = LanResManager.getLanCommonTextWords("不可领悟");
               this.tishengBtn.enabled = false;
            }
         }
      }
      
      public function setSkill(param1:int, param2:Boolean) : void
      {
         var _loc4_:ItemFace = null;
         while(this.jinengSpr.numChildren > 0)
         {
            this.jinengSpr.removeChildAt(0);
         }
         var _loc3_:Skill = new Skill(param1);
         if(param2)
         {
            _loc3_.isLearn = 1;
         }
         else
         {
            _loc3_.isLearn = 0;
         }
         _loc4_ = new ItemFace(_loc3_);
         _loc4_.showKungFuTag();
         _loc4_.setShowCount(false);
         this.jinengSpr.addChild(_loc4_);
      }
      
      public function showTuPoPanel(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.taohuazhen.x == 138)
            {
               TweenMax.to(this.taohuazhen,1,{"x":410});
               this.tupoBo = true;
               this.shangyiyeButton.enabled = false;
               this.xiayiyeButton.enabled = false;
               this.tishengBtn.enabled = false;
            }
         }
         else
         {
            if(this.taohuazhen.x == 410)
            {
               TweenMax.to(this.taohuazhen,1,{"x":138});
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_TAOHUAZHEN_ZIDONGTISHENG_CLICK,"",false));
            }
            this.tupoBo = false;
            this.shangyiyeButton.enabled = true;
            this.xiayiyeButton.enabled = true;
            this.tishengBtn.enabled = true;
            if(this.lookingId == 1)
            {
               this.shangyiyeButton.enabled = false;
            }
            if(this.lookingId >= this.TAOHUAZHEN_MAX)
            {
               this.xiayiyeButton.enabled = false;
            }
         }
      }
      
      public function isTupoCanvasShow() : Boolean
      {
         if(this.taohuazhen.x == 410)
         {
            return true;
         }
         return false;
      }
      
      public function setTupoInit(param1:String, param2:String, param3:Boolean, param4:String, param5:int, param6:Boolean, param7:int) : void
      {
         this.taohuazhen.setTupoInit(param1,param2,param3,param4,param5,param6,param7);
      }
      
      public function setZhufuzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this.taohuazhen.setZhufuzhi(param1,param2,param3);
      }
      
      public function setGoods(param1:Goods, param2:Boolean) : void
      {
         this.taohuazhen.setGoods(param1,param2);
      }
      
      public function setTuPoBtn(param1:Boolean) : void
      {
         this.taohuazhen.setTuPoBtn(param1);
      }
      
      public function setEnableFun() : void
      {
         this.shangyiyeButton.enabled = false;
         this.xiayiyeButton.enabled = false;
         this.tishengBtn.enabled = false;
      }
      
      private function onSkillMouseDown(param1:MouseEvent) : void
      {
         this.mainSkillContainer.addEventListener(MouseEvent.MOUSE_MOVE,this.onSkillMouseMove);
         this.p = new Point(mouseX,mouseY);
         this.currSkill = param1.target as ItemFace;
      }
      
      private function onSkillMouseMove(param1:MouseEvent) : void
      {
         if(this.currSkill != param1.target)
         {
            this.mainSkillContainer.removeEventListener(MouseEvent.MOUSE_MOVE,this.onSkillMouseMove);
            return;
         }
         if(Math.abs(this.p.x - mouseX) > 5 || Math.abs(this.p.y - mouseY) > 5 || Math.sqrt(this.p.x * this.p.x + this.p.y * this.p.y) > 5)
         {
            if((this.currSkill.getBaseItem() as Skill).res.useway == 1 && (this.currSkill.getBaseItem() as Skill).isLearn == 1)
            {
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DINGCHANJUE_SKILL_DRAG,"",this.currSkill));
            }
            this.mainSkillContainer.removeEventListener(MouseEvent.MOUSE_MOVE,this.onSkillMouseMove);
         }
      }
      
      private function onSkillMouseUp(param1:MouseEvent) : void
      {
         this.mainSkillContainer.removeEventListener(MouseEvent.MOUSE_MOVE,this.onSkillMouseMove);
      }
      
      public function setSkillJiHuo(param1:int, param2:Boolean) : void
      {
         while(this.mainSkillContainer.numChildren > 0)
         {
            this.mainSkillContainer.removeChildAt(0);
         }
         if(this.mainSkillItemFace)
         {
            if(this.mainSkillItemFace.parent)
            {
               this.mainSkillItemFace.parent.removeChild(this.mainSkillItemFace);
            }
         }
         var _loc3_:Skill = new Skill(param1);
         this.mainSkill = _loc3_;
         if(param2)
         {
            this.mainSkill.isLearn = 1;
         }
         else
         {
            this.mainSkill.isLearn = 0;
         }
         this.mainSkillItemFace = new ItemFace(this.mainSkill);
         this.mainSkillItemFace.showKungFuTag();
         this.mainSkillItemFace.setShowCount(false);
         this.mainSkillContainer.addChild(this.mainSkillItemFace);
      }
   }
}

