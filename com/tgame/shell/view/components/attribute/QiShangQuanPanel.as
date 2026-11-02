package com.tgame.shell.view.components.attribute
{
   import br.com.stimuli.loading.loadingtypes.LoadingItem;
   import com.fireice.button.FSimpleButton;
   import com.fireice.checkBox.FCheckBox;
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.FLoader;
   import com.fireice.util.Tools;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.GameState;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.utils.ToolTips;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.common.vo.item.Skill;
   import com.tgame.moudels.qishangquan.model.info.QiShangQuanVo;
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
   import flash.text.*;
   import gs.TweenMax;
   
   public class QiShangQuanPanel extends Sprite
   {
      
      private static var MAX_LEVEL:int = 9;
      
      private static var IMAGE_SPAN:int = 2;
      
      private static var IMAGE_X_UNSCALED:int = 100;
      
      private static var IMAGE_Y_UNSCALED:int = 100;
      
      private static var IMAGE_SCALE_X:Number = 1.53;
      
      private static var IMAGE_SCALE_Y:Number = 1.53;
      
      public var _$parent:DisplayObject;
      
      private var fc1:FCanvas;
      
      private var lb:FTextArea;
      
      private var fta1:FTextArea;
      
      private var fta2:FTextArea;
      
      private var fta3:FTextArea;
      
      private var fta4:FTextArea;
      
      private var fta5:FTextArea;
      
      private var buf:FTextArea;
      
      private var previousButton:FSimpleButton;
      
      private var nextButton:FSimpleButton;
      
      private var ft:FTextArea;
      
      private var tf:TextFormat;
      
      private var barBg1:Bitmap;
      
      private var barBar1:ColorBar;
      
      private var fireBarMC:MovieClip = null;
      
      private var fb1:FLabel;
      
      private var img:Bitmap;
      
      private var jieShao:SecondButton;
      
      private var shuomingPanel:QiShangQuanJieShao;
      
      private var buyBtn:SecondButton;
      
      private var kslwBtn:SecondButton;
      
      private var zdlwBtn:SecondButton;
      
      private var goodsId:int;
      
      private var item:ItemFace;
      
      private var Obj:Object;
      
      private var yanhuaMc:MovieClip;
      
      private var t:int;
      
      private var n:int;
      
      private var buffSpr:Sprite;
      
      private var gongImg:DisplayObject;
      
      private var gongImgObj:Object;
      
      private var selectedQuan:MovieClip;
      
      private var lastLevel:int = 1;
      
      private var container:Sprite;
      
      private var containerMask:Sprite;
      
      private var posXofYanhua:int = 90;
      
      public var bgImg:Bitmap;
      
      private var otherInfoCanvas:QiShangQuanOtherInfoCanvas;
      
      private var fanBeiFta:FTextArea;
      
      private var fts1:FTextArea;
      
      private var fts2:FTextArea;
      
      private var fts3:FTextArea;
      
      private var mainSkillContainer:Sprite;
      
      private var currSkill:ItemFace;
      
      private var p:Point;
      
      private var mainSkillItemFace:ItemFace;
      
      private var kuang1:Bitmap;
      
      private var fts4:FTextArea;
      
      private var fts5:FTextArea;
      
      private var checkZq:FCheckBox;
      
      private var fts6:FTextArea;
      
      private var fts7:FTextArea;
      
      private var fts8:FTextArea;
      
      private var checkDt:FCheckBox;
      
      public function QiShangQuanPanel()
      {
         var $mask:Sprite;
         var i:int;
         var tf1:TextFormat = null;
         var s:Sprite = null;
         this.Obj = {};
         this.gongImgObj = {};
         this.selectedQuan = new MovieClip();
         super();
         this.fc1 = new FCanvas();
         this.fc1.x = 0;
         this.fc1.y = 2;
         this.fc1.width = 402;
         this.fc1.height = 365;
         this.fc1.skin = "box_transparence";
         addChild(this.fc1);
         this.fc1 = new FCanvas();
         this.fc1.x = 2;
         this.fc1.y = 4;
         this.fc1.width = 398;
         this.fc1.height = 203;
         this.fc1.skin = "box_transparence";
         addChild(this.fc1);
         this.fc1 = new FCanvas();
         this.fc1.x = 2;
         this.fc1.y = 231;
         this.fc1.width = 203;
         this.fc1.height = 134;
         this.fc1.skin = "box_transparence";
         addChild(this.fc1);
         this.fc1 = new FCanvas();
         this.fc1.x = 204;
         this.fc1.y = 231;
         this.fc1.width = 196;
         this.fc1.height = 134;
         this.fc1.skin = "box_transparence";
         addChild(this.fc1);
         this.bgImg = new Bitmap();
         this.bgImg.name = "ui.qishangquan.bg";
         addChild(this.bgImg);
         this.otherInfoCanvas = new QiShangQuanOtherInfoCanvas();
         addChild(this.otherInfoCanvas);
         this.otherInfoCanvas.x = 142;
         this.otherInfoCanvas.y = 160;
         $mask = new Sprite();
         $mask.mouseEnabled = false;
         addChild($mask);
         $mask.x = 414;
         $mask.y = 160;
         with($mask.graphics)
         {
            beginFill(16711680,0.5);
            drawRect(0,0,260,225);
            endFill();
         }
         this.otherInfoCanvas.mask = $mask;
         this.container = new Sprite();
         this.container.x = 200;
         this.container.y = 48 + 15;
         addChild(this.container);
         this.containerMask = new Sprite();
         addChild(this.containerMask);
         this.containerMask.graphics.beginFill(0);
         this.containerMask.graphics.drawRect(0 + 40,15,385 - 40,212);
         this.containerMask.graphics.endFill();
         this.container.mask = this.containerMask;
         this.jieShao = new SecondButton();
         this.jieShao.label = LanResManager.getLanCommonTextWords("七伤拳介绍");
         addChild(this.jieShao);
         this.jieShao.x = 309;
         this.jieShao.y = 9;
         this.jieShao.addEventListener(MouseEvent.CLICK,this.onJieShaoBtnClick);
         this.previousButton = new FSimpleButton();
         this.previousButton.skin = "QiShangQuanPreviousButton";
         addChild(this.previousButton);
         this.previousButton.x = 10;
         this.previousButton.y = 105;
         this.previousButton.addEventListener(MouseEvent.CLICK,this.onClick);
         this.nextButton = new FSimpleButton();
         this.nextButton.skin = "QiShangQuanNextButton";
         addChild(this.nextButton);
         this.nextButton.x = 370;
         this.nextButton.y = 105;
         this.nextButton.addEventListener(MouseEvent.CLICK,this.onClick);
         this.ft = new FTextArea();
         this.tf = new TextFormat();
         this.tf.align = "center";
         with(this.ft)
         {
            multiline = true;
            filters = StaticValue.filter;
            defaultTextFormat = tf;
            width = 116 + 6 + 10 + 6 + 80;
            height = 16;
            x = 233 - 93 - 30;
            y = 10;
            textColor = StaticValue.WHITE;
            htmlText = "";
         }
         addChild(this.ft);
         this.barBar1 = new ColorBar(5,373 + 4,8);
         addChild(this.barBar1);
         this.barBar1.x = 14;
         this.barBar1.y = 220;
         this.fta2 = new FTextArea();
         tf1 = new TextFormat();
         tf1.size = 12;
         tf1.color = 65276;
         with(this.fta2)
         {
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            defaultTextFormat = tf1;
            width = 110;
            height = 20;
            x = 10;
            y = 235;
            textColor = StaticValue.GREEN;
            htmlText = LanResManager.getLanCommonTextWords("七伤拳属性加成");
         }
         addChild(this.fta2);
         this.fta3 = new FTextArea();
         with(this.fta3)
         {
            filters = StaticValue.filter;
            x = 10;
            y = 250;
            autoSize = TextFieldAutoSize.LEFT;
            htmlText = "";
         }
         addChild(this.fta3);
         this.fanBeiFta = new FTextArea();
         with(this.fanBeiFta)
         {
            filters = StaticValue.filter;
            x = 10 + 85;
            y = 250;
            autoSize = TextFieldAutoSize.LEFT;
            htmlText = "";
         }
         addChild(this.fanBeiFta);
         this.fta4 = new FTextArea();
         tf1 = new TextFormat();
         tf1.size = 12;
         tf1.color = 65276;
         with(this.fta4)
         {
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            defaultTextFormat = tf1;
            width = 200;
            height = 20;
            x = 3;
            y = 275;
            textColor = StaticValue.ORANGE_HTML;
            htmlText = "<textformat leading=\'6\'><font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("七伤拳领悟说明当天领悟前次，每次增加点攻击，次之后点燃火焰，继续领悟每次增加点攻击。") + "</font><font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("每天凌晨点清空火焰(进度保留)，重新领悟按点攻击计数。") + "</font>" + "</textformat>";
         }
         addChild(this.fta4);
         this.fta1 = new FTextArea();
         with(this.fta1)
         {
            filters = StaticValue.filter;
            x = 275;
            y = 235;
            width = 120;
            wordWrap = true;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.WHITE;
            htmlText = "";
         }
         addChild(this.fta1);
         this.fb1 = new FLabel();
         with(this.fb1)
         {
            x = 214 + 10;
            y = 235;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            text = "";
         }
         addChild(this.fb1);
         this.img = StaticValue.getBitmapByClassName("ui.tiem.slot");
         addChild(this.img);
         this.img.x = 218 + 10;
         this.img.y = 252;
         this.buyBtn = new SecondButton();
         this.buyBtn.label = LanResManager.getLanCommonTextWords("购买");
         this.buyBtn.x = 216 + 10;
         this.buyBtn.y = 293;
         this.buyBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.fta5 = new FTextArea();
         with(this.fta5)
         {
            filters = StaticValue.filter;
            x = 216 + 10;
            y = 320;
            autoSize = TextFieldAutoSize.LEFT;
            htmlText = "";
         }
         addChild(this.fta5);
         this.buf = new FTextArea();
         with(this.buf)
         {
            filters = StaticValue.filter;
            x = 295 + 10;
            y = 300;
            autoSize = TextFieldAutoSize.LEFT;
            htmlText = "";
         }
         addChild(this.buf);
         this.kslwBtn = new SecondButton();
         this.kslwBtn.label = LanResManager.getLanCommonTextWords("开始领悟");
         addChild(this.kslwBtn);
         this.kslwBtn.x = 216 + 10;
         this.kslwBtn.y = 340;
         this.kslwBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.zdlwBtn = new SecondButton();
         this.zdlwBtn.label = LanResManager.getLanCommonTextWords("自动领悟");
         addChild(this.zdlwBtn);
         this.zdlwBtn.x = 325;
         this.zdlwBtn.y = 340;
         this.zdlwBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         i = 1;
         while(i <= MAX_LEVEL)
         {
            if(this.gongImgObj[i] == null)
            {
               this.gongImg = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/qishangquan/" + i + ".png",IMAGE_X_UNSCALED,IMAGE_Y_UNSCALED);
               s = new Sprite();
               this.gongImg.x = -this.gongImg.width / 2;
               this.gongImg.y = -this.gongImg.height / 2;
               s.addChild(this.gongImg);
               this.gongImgObj[i] = s;
               if(i == 1 || i > 2)
               {
                  s.x = 0;
                  s.filters = Tools.blackWhiteFilter;
               }
               else
               {
                  s.x = IMAGE_X_UNSCALED + IMAGE_SPAN;
                  s.filters = Tools.blackWhiteFilter;
               }
               s.y = 55;
               this.container.addChild(s);
            }
            i++;
         }
         i = 0;
         if(this.gongImgObj[i] == null)
         {
            this.gongImg = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/qishangquan/0.png",IMAGE_X_UNSCALED,IMAGE_Y_UNSCALED);
            s = new Sprite();
            this.gongImg.x = -this.gongImg.width / 2;
            this.gongImg.y = -this.gongImg.height / 2;
            s.addChild(this.gongImg);
            this.gongImgObj[i] = s;
            s.x = -(IMAGE_X_UNSCALED + IMAGE_SPAN);
            s.y = 55;
            this.container.addChild(s);
         }
         i = MAX_LEVEL + 1;
         if(this.gongImgObj[i] == null)
         {
            this.gongImg = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/qishangquan/0.png",IMAGE_X_UNSCALED,IMAGE_Y_UNSCALED);
            s = new Sprite();
            this.gongImg.x = -this.gongImg.width / 2;
            this.gongImg.y = -this.gongImg.height / 2;
            s.addChild(this.gongImg);
            this.gongImgObj[i] = s;
            s.x = IMAGE_X_UNSCALED + IMAGE_SPAN;
            s.y = 55;
            s.visible = false;
            this.container.addChild(s);
         }
         this.gongImgObj[1].scaleX = IMAGE_SCALE_X;
         this.gongImgObj[1].scaleY = IMAGE_SCALE_Y;
         if(this.container.contains(this.gongImgObj[1]))
         {
            this.container.setChildIndex(this.gongImgObj[1],this.container.numChildren - 1);
         }
         LoaderManager.lazyLoad(function(param1:Event):void
         {
            var _loc2_:LoadingItem = param1.target as LoadingItem;
            selectedQuan = _loc2_.content as MovieClip;
            selectedQuan.x = -selectedQuan.width / 2 - 5;
            selectedQuan.y = -selectedQuan.height / 2 + 50;
            container.addChild(selectedQuan);
            if(container.contains(selectedQuan))
            {
               container.setChildIndex(selectedQuan,container.numChildren - 2);
            }
         },null,false,GameConfig.fileBaseFolder + "res/data/mc/qishangquan/selected.swf");
         this.fts1 = new FTextArea();
         this.fts1.x = 10;
         this.fts1.y = 26;
         this.fts1.textColor = StaticValue.GREEN;
         this.fts1.width = 170;
         this.fts1.height = 20;
         this.fts1.htmlText = LanResManager.getLanCommonTextWords("七伤拳究极激活秘籍（已激活）");
         this.fts1.visible = false;
         addChild(this.fts1);
         ToolTips.createToolTips(this.fts1,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("攻击2088888888 防御1688888888 暴击2888 闪避2888血量2088888888、所有武功提升2180层") + "<br>";
            return _loc1_ + "</font></textformat>";
         });
         this.fts2 = new FTextArea();
         this.fts2.x = 10;
         this.fts2.y = 46;
         this.fts2.textColor = StaticValue.GREEN;
         this.fts2.width = 200;
         this.fts2.height = 20;
         this.fts2.htmlText = LanResManager.getLanCommonTextWords("暴雨梨花秘籍（已激活）");
         this.fts2.visible = false;
         addChild(this.fts2);
         ToolTips.createToolTips(this.fts2,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("特殊属性：攻击 68888亿、防御60888亿、血量80888亿、所有武功提升 3880000层") + "<br>" + LanResManager.getLanCommonTextWords("攻速188和施放速度2%") + "<br>" + LanResManager.getLanCommonTextWords("暴雨继承：可继承暴雨梨花冰、火、雨技能.") + "<br>" + LanResManager.getLanCommonTextWords("暴雨梨花：攻击时有几率暴雨梨花，持续10秒；在此状态下，每攻击到任何一个玩家，") + "<br>" + LanResManager.getLanCommonTextWords("该玩家极5格范围内的所有玩家都将受到暴雨梨花的效果影响，所有对手在30秒内无法") + "<br>" + LanResManager.getLanCommonTextWords("使用任何技能；且当状态解除后，命中暴雨梨花的玩家将定身于原地15秒无法移动。") + "<br>" + LanResManager.getLanCommonTextWords("梨花剑雨：攻击时有几率触发梨花剑雨，持续10秒；自身在此状态下，攻击速度将提升") + "<br>" + LanResManager.getLanCommonTextWords("至极限，按人物的原来攻速提升在提升至300%。") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.fts3 = new FTextArea();
         this.fts3.x = 20 + 208 + 15;
         this.fts3.y = 20 + 158 - 130;
         this.fts3.textColor = StaticValue.GREEN;
         this.fts3.width = 170;
         this.fts3.height = 20;
         this.fts3.htmlText = LanResManager.getLanCommonTextWords("神犬出动(已激活)");
         addChild(this.fts3);
         ToolTips.createToolTips(this.fts3,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("攻击：56888亿、防御52888亿、血量60888亿、所有武功提升 480000层") + "<br>" + LanResManager.getLanCommonTextWords("可锁定任意一个玩家施发神犬，对手的身边将出现一只犬撕咬住对手，被撕咬的对手将定身于") + "<br>" + LanResManager.getLanCommonTextWords("原地无法移动，持续10秒；当状态解除后，对手中神犬毒，每秒持续掉血10%，持续5秒。冷却") + "<br>" + LanResManager.getLanCommonTextWords("90秒。") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.kuang1 = StaticValue.getBitmapByClassName("ui.tiem.slot");
         addChild(this.kuang1);
         this.kuang1.x = 25 + 324;
         this.kuang1.y = 160 + 35 - 186 + 158 - 130;
         this.mainSkillContainer = new Sprite();
         this.mainSkillContainer.x = 25 + 2 + 324;
         this.mainSkillContainer.y = 160 + 2 + 35 - 186 + 158 - 130;
         addChild(this.mainSkillContainer);
         this.mainSkillContainer.addEventListener(MouseEvent.MOUSE_DOWN,this.onSkillMouseDown);
         this.mainSkillContainer.addEventListener(MouseEvent.MOUSE_UP,this.onSkillMouseUp);
         this.fts4 = new FTextArea();
         this.fts4.x = 10;
         this.fts4.y = 46 + 20;
         this.fts4.textColor = StaticValue.GREEN;
         this.fts4.width = 200;
         this.fts4.height = 20;
         this.fts4.htmlText = LanResManager.getLanCommonTextWords("刑天秘籍（已激活）");
         this.fts4.visible = false;
         addChild(this.fts4);
         ToolTips.createToolTips(this.fts4,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("特殊属性：攻击12888888888888 防御10888888888888 血量13888888888888") + "<br>" + LanResManager.getLanCommonTextWords("暴击 88888闪避 88888所有武功提升2000000层 ") + "<br>" + LanResManager.getLanCommonTextWords("附加属性：全属性提升3000% 攻速+208") + "<br>" + LanResManager.getLanCommonTextWords("刑天之力（特殊技能）：每攻击36次必定触发刑天之力，使对手的乘骑状态消失，冷却时间20秒。") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.fts5 = new FTextArea();
         this.fts5.x = 10 + 255 + 40;
         this.fts5.y = 7 + 20 + 105;
         this.fts5.textColor = StaticValue.GREEN;
         this.fts5.width = 110;
         this.fts5.height = 20;
         this.fts5.htmlText = LanResManager.getLanCommonTextWords("吞天雀");
         this.fts5.visible = false;
         addChild(this.fts5);
         ToolTips.createToolTips(this.fts5,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("攻击 68888亿、防御 60888亿、血量 80888亿、所有武功提升 880000层") + "<br>" + LanResManager.getLanCommonTextWords("吞天雀：即正即邪，全身犹如黑暗缠绕，又金光四射，上古鸟类之首，人物可自己骑乘。") + "<br>" + LanResManager.getLanCommonTextWords("吞云吐雾：攻击时有几率触发吞云吐雾，持续10秒；在此状态下，吞天雀将可瞬间将对") + "<br>" + LanResManager.getLanCommonTextWords("手吸至身旁造成对手在原地眩晕倒地不起，持续10秒；对手在此效果下，吞天雀将每秒") + "<br>" + LanResManager.getLanCommonTextWords("施雨羽毛箭雨可瞬间使对手的所有勋章失效，掉血60%，且当状态解除后，吞天雀施发") + "<br>" + LanResManager.getLanCommonTextWords("雀群展翅可瞬间在反弹击退对手。") + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.checkZq = new FCheckBox();
         addChild(this.checkZq);
         this.checkZq.x = 256 + 117;
         this.checkZq.y = 7 + 20 + 105;
         this.checkZq.addEventListener(MouseEvent.CLICK,this.onCheckClick);
         this.fts6 = new FTextArea();
         this.fts6.x = 10;
         this.fts6.y = 46 + 20 + 20;
         this.fts6.textColor = StaticValue.GREEN;
         this.fts6.width = 200;
         this.fts6.height = 20;
         this.fts6.htmlText = LanResManager.getLanCommonTextWords("吞天秘籍（已激活）");
         this.fts6.visible = false;
         addChild(this.fts6);
         ToolTips.createToolTips(this.fts6,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("吞天灭地：拥有吞天雀的玩家，攻击时有几率触发吞天灭地状态，持续10秒；") + "<br>" + LanResManager.getLanCommonTextWords("吞天飞翔，天地震动，吞天雀可瞬间将天空吞噬，场景范围5格内所有玩家天") + "<br>" + LanResManager.getLanCommonTextWords("空将呈现黑暗，且黑暗将吞噬所有时间，使对手的时间静止，任何操作都将") + "<br>" + LanResManager.getLanCommonTextWords("无效。") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.fts7 = new FTextArea();
         this.fts7.x = 10;
         this.fts7.y = 46 + 20 + 20 + 20;
         this.fts7.textColor = StaticValue.GREEN;
         this.fts7.width = 200;
         this.fts7.height = 20;
         this.fts7.htmlText = LanResManager.getLanCommonTextWords("劫天秘籍（已激活）");
         this.fts7.visible = false;
         addChild(this.fts7);
         ToolTips.createToolTips(this.fts7,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("攻击108888亿、防御80888亿、血量108888亿、所有武功800000层") + "<br>" + LanResManager.getLanCommonTextWords("劫天——传闻它是天界之门，乃十大神器之首，毁天灭地，吞噬诸天！") + "<br>" + LanResManager.getLanCommonTextWords("攻击时100%触发雷神之怒效果，对对手5格范围内所有玩家瞬间掉60%") + "<br>" + LanResManager.getLanCommonTextWords("血量和附加一个雷电印记，印记持续30秒且无法被清除。当累积到3个") + "<br>" + LanResManager.getLanCommonTextWords("印记后，对手将被束缚于无尽深渊，无法移动，持续3秒。雷神之怒技") + "<br>" + LanResManager.getLanCommonTextWords("能无冷却时间！") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.fts8 = new FTextArea();
         this.fts8.x = 10 + 255 + 40 - 20;
         this.fts8.y = 7 + 20 + 105 + 25;
         this.fts8.textColor = StaticValue.GREEN;
         this.fts8.width = 110;
         this.fts8.height = 20;
         this.fts8.htmlText = LanResManager.getLanCommonTextWords("飞龙在天（神）");
         this.fts8.visible = false;
         addChild(this.fts8);
         ToolTips.createToolTips(this.fts8,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("68888亿、防御 60888亿、血量 80888亿、所有武功提升 880000层") + "<br>" + LanResManager.getLanCommonTextWords("飞龙傲翔：天空的霸主-龙，激活飞龙在天的玩家，可永久获得飞空傲翔守护。") + "<br>" + LanResManager.getLanCommonTextWords("飞龙幻影：攻击时有几率触发龙飞幻影，持续10秒；在此状态下，对手眼中将") + "<br>" + LanResManager.getLanCommonTextWords("出现千万飞龙幻影使对手无法锁定，且自身在此效果下，犹如隐身可随意攻击") + "<br>" + LanResManager.getLanCommonTextWords("对手，使对手陷入被动又无法状态；且自身每攻击对手一次，将同时封印对手") + "<br>" + LanResManager.getLanCommonTextWords("所有能力，使其瞬间定身原地，且所有勋章失效，持续10秒。") + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.checkDt = new FCheckBox();
         addChild(this.checkDt);
         this.checkDt.x = 256 + 117;
         this.checkDt.y = 7 + 20 + 105 + 25;
         this.checkDt.addEventListener(MouseEvent.CLICK,this.onCheckClick);
      }
      
      private function onCheckClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.checkZq:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.checkZq.selectState,67]));
               break;
            case this.checkDt:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.checkDt.selectState,72]));
         }
      }
      
      private function onJieShaoBtnClick(param1:MouseEvent) : void
      {
         if(!this.shuomingPanel)
         {
            this.shuomingPanel = new QiShangQuanJieShao();
         }
         GameInstance.uiInstance.uiContainer.addChild(this.shuomingPanel);
         this.shuomingPanel.visible = true;
         this.shuomingPanel.x = (GameConfig.sceneWidth - this.shuomingPanel.width) / 2;
         this.shuomingPanel.y = (GameConfig.sceneHeight - this.shuomingPanel.height) / 2;
      }
      
      public function onShowLv(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.otherInfoCanvas.x < 414)
            {
               TweenMax.to(this.otherInfoCanvas,1,{"x":414});
            }
         }
         else if(this.otherInfoCanvas.x > 142)
         {
            TweenMax.to(this.otherInfoCanvas,1,{"x":142});
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.previousButton:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.QISHANGQUAN_ARROW_CLICK,"",0));
               break;
            case this.nextButton:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.QISHANGQUAN_ARROW_CLICK,"",1));
               break;
            case this.kslwBtn:
               this.posXofYanhua = 90;
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_QISHANGQUAN_KAISHITISHENG_CLICKJ));
               break;
            case this.zdlwBtn:
               this.posXofYanhua = 190;
               if(this.zdlwBtn.label == LanResManager.getLanCommonTextWords("自动领悟"))
               {
                  this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_QISHANGQUAN_ZIDONGTISHENG_CLICKJ,"",true));
               }
               else
               {
                  this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_QISHANGQUAN_ZIDONGTISHENG_CLICKJ,"",false));
               }
               break;
            case this.buyBtn:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.QISHANGQUAN_GOUMAI_CLICK,"",this.goodsId));
         }
      }
      
      private function aa(param1:Event = null) : void
      {
         var e:Event = param1;
         var ftaw1:FTextArea = new FTextArea();
         with(ftaw1)
         {
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.CENTER;
            x = 145;
            y = 216;
            textColor = StaticValue.YELLOW;
            width = 132;
            htmlText = LanResManager.getLanCommonTextWords("攻击力+") + String(n);
         }
         addChild(ftaw1);
         TweenMax.to(ftaw1,1.5,{
            "y":181,
            "onComplete":this.onCom1,
            "onCompleteParams":[ftaw1]
         });
      }
      
      private function showOnceText() : void
      {
         var ftaw1:FTextArea = null;
         ftaw1 = new FTextArea();
         with(ftaw1)
         {
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.CENTER;
            x = 30;
            y = 216;
            textColor = StaticValue.RED_HTML;
            width = 350;
            htmlText = "<textformat leading=\'6\'><font color=\'" + StaticValue.RED_HTML + "\' size=\'16\'>" + LanResManager.getLanCommonTextWords("当天的心法已领悟满100次，将开始领悟招式学习！") + "</font>" + "</textformat>";
         }
         addChild(ftaw1);
         TweenMax.to(ftaw1,4,{
            "y":80,
            "onComplete":function():void
            {
               TweenMax.to(ftaw1,3,{
                  "alpha":0,
                  "onComplete":onCom1,
                  "onCompleteParams":[ftaw1]
               });
            }
         });
      }
      
      private function onCom1(param1:FTextArea) : void
      {
         if(param1 != null && param1.parent != null)
         {
            param1.parent.removeChild(param1);
         }
      }
      
      public function setInitializeText(param1:Boolean, param2:String, param3:int) : void
      {
         this.fta1.htmlText = "<textformat leading=\'0\'>" + param2 + "</textformat>";
         this.fta3.htmlText = "<textformat leading=\'6\'><font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("攻击：") + param3 + "</font><br>" + "</textformat>";
         this.setJiHuo(param1);
      }
      
      public function setJiHuo(param1:Boolean) : void
      {
         if(param1)
         {
            this.fts1.visible = GameState.dictMainStatus[SpecialGoodsID.QISHANGQUAN_JIUJI_ID];
            this.fts2.visible = GameState.dictMainStatus[SpecialGoodsID.QISHANGQUAN_BAOYULIHUA_ID];
            this.fts3.visible = GameState.dictMainStatus[SpecialGoodsID.QISHANGQUAN_QUANSHENCHUDONG_ID];
            if(GameState.dictMainStatus[SpecialGoodsID.QISHANGQUAN_QUANSHENCHUDONG_ID])
            {
               this.setSkillJiHuo(200341,true);
               this.mainSkillContainer.visible = true;
               this.kuang1.visible = true;
            }
            else
            {
               this.mainSkillContainer.visible = false;
               this.kuang1.visible = false;
            }
            this.fts4.visible = GameState.dictMainStatus[SpecialGoodsID.QISHANGQUAN_XINGTIANMIJI_ID];
            this.fts5.visible = GameState.dictMainStatus[SpecialGoodsID.QISHANGQUAN_TUNTIANQUE_ID];
            this.checkZq.visible = GameState.dictMainStatus[SpecialGoodsID.QISHANGQUAN_TUNTIANQUE_ID];
            this.fts6.visible = GameState.dictMainStatus[SpecialGoodsID.QISHANGQUAN_TUNTIANMIJI_ID];
            this.fts7.visible = GameState.dictMainStatus[SpecialGoodsID.QISHANGQUAN_JIETIANMIJI_ID];
            this.fts8.visible = GameState.dictMainStatus[SpecialGoodsID.QISHANGQUAN_FEILONGZAITIAN_ID];
            this.checkDt.visible = GameState.dictMainStatus[SpecialGoodsID.QISHANGQUAN_FEILONGZAITIAN_ID];
         }
         else
         {
            this.fts1.visible = GameState.dictTargetStatus[SpecialGoodsID.QISHANGQUAN_JIUJI_ID];
            this.fts2.visible = GameState.dictTargetStatus[SpecialGoodsID.QISHANGQUAN_BAOYULIHUA_ID];
            this.fts3.visible = GameState.dictTargetStatus[SpecialGoodsID.QISHANGQUAN_QUANSHENCHUDONG_ID];
            if(GameState.dictTargetStatus[SpecialGoodsID.QISHANGQUAN_QUANSHENCHUDONG_ID])
            {
               this.setSkillJiHuo(200341,true);
               this.mainSkillContainer.visible = true;
               this.kuang1.visible = true;
            }
            else
            {
               this.mainSkillContainer.visible = false;
               this.kuang1.visible = false;
            }
            this.fts4.visible = GameState.dictTargetStatus[SpecialGoodsID.QISHANGQUAN_XINGTIANMIJI_ID];
            this.fts5.visible = GameState.dictTargetStatus[SpecialGoodsID.QISHANGQUAN_TUNTIANQUE_ID];
            this.checkZq.visible = GameState.dictTargetStatus[SpecialGoodsID.QISHANGQUAN_TUNTIANQUE_ID];
            this.fts6.visible = GameState.dictTargetStatus[SpecialGoodsID.QISHANGQUAN_TUNTIANMIJI_ID];
            this.fts7.visible = GameState.dictTargetStatus[SpecialGoodsID.QISHANGQUAN_JIETIANMIJI_ID];
            this.fts8.visible = GameState.dictTargetStatus[SpecialGoodsID.QISHANGQUAN_FEILONGZAITIAN_ID];
            this.checkDt.visible = GameState.dictTargetStatus[SpecialGoodsID.QISHANGQUAN_FEILONGZAITIAN_ID];
         }
      }
      
      public function setFanBei(param1:int) : void
      {
         if(param1 == 0)
         {
            this.fanBeiFta.htmlText = "<textformat leading=\'6\'><font color=\'" + StaticValue.GREEN_HTML + "\'>" + "" + "</font><br>" + "</textformat>";
         }
         else
         {
            this.fanBeiFta.htmlText = "<textformat leading=\'6\'><font color=\'" + StaticValue.GREEN_HTML + "\'>" + "x2" + "</font><br>" + "</textformat>";
         }
      }
      
      public function setGoods(param1:Goods, param2:String, param3:int, param4:Boolean) : void
      {
         this.goodsId = param1.id;
         this.fb1.text = param2;
         if(this.item != null && this.item.parent != null)
         {
            this.item.parent.removeChild(this.item);
         }
         this.item = new ItemFace(param1);
         this.item.x = 220 + 10;
         this.item.y = 254;
         addChild(this.item);
         if(param1.count > 0)
         {
            this.item.filters = [];
         }
         else
         {
            this.item.filters = Tools.blackWhiteFilter;
         }
         if(param4)
         {
            this.fta5.htmlText = "<textformat leading=\'4\'><font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("消耗") + "：" + param3 + LanResManager.getLanCommonTextWords("本") + "</textformat>";
         }
         else
         {
            this.fta5.htmlText = "<textformat leading=\'4\'><font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("消耗") + "：" + param3 + LanResManager.getLanCommonTextWords("本") + "</textformat>";
         }
      }
      
      public function setJinduNum(param1:int, param2:int, param3:int, param4:Boolean, param5:Boolean) : *
      {
         this.n = param3;
         if(param1 > param2)
         {
            this.barBar1.setValue(param2,param2);
         }
         else
         {
            this.barBar1.setValue(param1,param2);
         }
         this.showFireBar(param4);
         if(!param5)
         {
            this.showOnceText();
         }
         if(this.n > 0)
         {
            this.aa();
         }
      }
      
      public function setZhaoShiMsg(param1:QiShangQuanVo, param2:String, param3:int, param4:int) : void
      {
         this.ft.htmlText = param2;
         if(param3 == 1)
         {
            this.previousButton.enabled = false;
         }
         else
         {
            this.previousButton.enabled = true;
         }
         if(param3 == param1.maxLevel)
         {
            this.nextButton.enabled = false;
         }
         else
         {
            this.nextButton.enabled = true;
         }
         if(param3 == 9)
         {
            this.buyBtn.enabled = false;
            this.kslwBtn.visible = false;
            this.zdlwBtn.visible = false;
            this.kslwBtn.label = LanResManager.getLanCommonTextWords("已领悟");
         }
         else if(param3 == param4)
         {
            this.kslwBtn.label = LanResManager.getLanCommonTextWords("开始领悟");
            this.kslwBtn.visible = true;
            this.kslwBtn.enabled = true;
            this.zdlwBtn.visible = true;
            this.zdlwBtn.enabled = true;
         }
         else if(param3 < param4)
         {
            this.kslwBtn.label = LanResManager.getLanCommonTextWords("已领悟");
            this.kslwBtn.visible = true;
            this.kslwBtn.enabled = false;
            this.zdlwBtn.visible = false;
         }
         else
         {
            this.kslwBtn.label = LanResManager.getLanCommonTextWords("未领悟");
            this.kslwBtn.visible = true;
            this.kslwBtn.enabled = false;
            this.zdlwBtn.visible = true;
            this.zdlwBtn.enabled = false;
         }
         this.setPicWithAnimation(param1,this.lastLevel,param3);
         this.lastLevel = param3;
      }
      
      private function setPicWithAnimation(param1:QiShangQuanVo, param2:int, param3:int) : void
      {
         var f:DisplayObject;
         var intL:int = 0;
         var intR:int = 0;
         var i:int = 0;
         var l:DisplayObject = null;
         var r:DisplayObject = null;
         var vo:QiShangQuanVo = param1;
         var currentLevel:int = param2;
         var fultureLevel:int = param3;
         var c:DisplayObject = this.gongImgObj[currentLevel] as DisplayObject;
         if(this.kslwBtn.label == LanResManager.getLanCommonTextWords("已领悟"))
         {
            c.filters = [];
         }
         else
         {
            c.filters = Tools.blackWhiteFilter;
         }
         this.otherInfoCanvas.setInitialize(vo);
         if(currentLevel == fultureLevel)
         {
            return;
         }
         f = this.gongImgObj[fultureLevel] as DisplayObject;
         if(fultureLevel >= 1)
         {
            if(this.kslwBtn.label == LanResManager.getLanCommonTextWords("已领悟"))
            {
               f.filters = [];
            }
            else
            {
               f.filters = Tools.blackWhiteFilter;
            }
            if(this.container.contains(f))
            {
               this.container.setChildIndex(f,this.container.numChildren - 1);
            }
            f.visible = true;
            TweenMax.to(f,0.2,{
               "scaleX":IMAGE_SCALE_X,
               "scaleY":IMAGE_SCALE_Y,
               "x":0,
               "onUpdate":function():void
               {
                  TweenMax.to(selectedQuan,0.1,{"alpha":0});
               },
               "onUpdateParams":[this.container],
               "onComplete":function():void
               {
                  if(container.contains(selectedQuan))
                  {
                     container.setChildIndex(selectedQuan,container.numChildren - 2);
                  }
                  TweenMax.to(selectedQuan,0,{"alpha":1});
               }
            });
            intL = fultureLevel - 1 >= 0 ? int(fultureLevel - 1) : -1;
            intR = fultureLevel + 1 <= MAX_LEVEL + 1 ? int(fultureLevel + 1) : -1;
            if(vo.maxLevel < MAX_LEVEL)
            {
               if(intR == MAX_LEVEL)
               {
                  intR = MAX_LEVEL + 1;
               }
            }
            i = 0;
            while(i <= MAX_LEVEL + 1)
            {
               if(i != fultureLevel && i != intL && i != intR)
               {
                  this.gongImgObj[i].visible = false;
                  this.gongImgObj[i].x = 0;
               }
               i++;
            }
            if(intL >= 0)
            {
               l = this.gongImgObj[intL] as DisplayObject;
               l.visible = true;
               if(this.container.contains(l))
               {
                  this.container.setChildIndex(l,this.container.numChildren - 3);
               }
               TweenMax.to(l,0.2,{
                  "scaleX":1,
                  "scaleY":1,
                  "x":-(IMAGE_X_UNSCALED + IMAGE_SPAN)
               });
               l.filters = Tools.blackWhiteFilter;
            }
            if(intR > 0)
            {
               r = this.gongImgObj[intR] as DisplayObject;
               r.visible = true;
               if(this.container.contains(r))
               {
                  this.container.setChildIndex(r,this.container.numChildren - 4);
               }
               TweenMax.to(r,0.2,{
                  "scaleX":1,
                  "scaleY":1,
                  "x":IMAGE_X_UNSCALED + IMAGE_SPAN
               });
               r.filters = Tools.blackWhiteFilter;
            }
            if(fultureLevel == MAX_LEVEL)
            {
               this.onShowLv(true);
            }
            else
            {
               this.onShowLv(false);
            }
         }
      }
      
      private function showFireBar(param1:Boolean) : void
      {
         var b:Boolean = param1;
         if(b)
         {
            this.barBar1.type = 6;
            if(!this.fireBarMC)
            {
               LoaderManager.lazyLoad(function(param1:Event):void
               {
                  if(fireBarMC)
                  {
                     return;
                  }
                  var _loc2_:LoadingItem = param1.target as LoadingItem;
                  fireBarMC = _loc2_.content as MovieClip;
                  fireBarMC.x = -11;
                  fireBarMC.y = 143;
                  fireBarMC.visible = true;
                  addChild(fireBarMC);
                  if(container.contains(fireBarMC))
                  {
                     setChildIndex(fireBarMC,6);
                  }
               },null,false,GameConfig.fileBaseFolder + "res/data/mc/qishangquan/firebar.swf");
            }
            if(Boolean(this.fireBarMC) && this.fireBarMC.parent != null)
            {
               this.fireBarMC.visible = true;
               if(this.container.contains(this.fireBarMC))
               {
                  setChildIndex(this.fireBarMC,6);
               }
            }
         }
         else
         {
            this.barBar1.type = 5;
            if(Boolean(this.fireBarMC) && this.fireBarMC.parent != null)
            {
               this.fireBarMC.visible = false;
            }
         }
      }
      
      public function setBtn(param1:Boolean) : void
      {
         if(param1)
         {
            this.zdlwBtn.label = LanResManager.getLanCommonTextWords("自动领悟");
         }
         else
         {
            this.zdlwBtn.label = LanResManager.getLanCommonTextWords("停止领悟");
         }
      }
      
      public function bofangYanhua() : void
      {
         if(Boolean(this.yanhuaMc) && this.yanhuaMc.parent != null)
         {
            this.yanhuaMc.parent.removeChild(this.yanhuaMc);
         }
         LoaderManager.lazyLoad(function(param1:Event):void
         {
            var _loc2_:LoadingItem = param1.target as LoadingItem;
            yanhuaMc = _loc2_.content as MovieClip;
            yanhuaMc.x = posXofYanhua;
            yanhuaMc.y = 156;
            addChild(yanhuaMc);
         },null,false,GameConfig.fileBaseFolder + "res/data/mc/qishangquan/yanhua.swf");
      }
      
      public function setQiShangQuanEnabledFun() : void
      {
         this.previousButton.enabled = false;
         this.nextButton.enabled = false;
         this.kslwBtn.visible = false;
         this.zdlwBtn.visible = false;
         this.buyBtn.enabled = false;
         this.jieShao.visible = false;
      }
      
      public function removeShuoming() : void
      {
         if(this.shuomingPanel != null && this.shuomingPanel.parent != null)
         {
            this.shuomingPanel.parent.removeChild(this.shuomingPanel);
         }
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
         if(param2)
         {
            _loc3_.isLearn = 1;
         }
         else
         {
            _loc3_.isLearn = 0;
         }
         this.mainSkillItemFace = new ItemFace(_loc3_);
         this.mainSkillItemFace.showKungFuTag();
         this.mainSkillItemFace.setShowCount(false);
         this.mainSkillContainer.addChild(this.mainSkillItemFace);
      }
      
      public function setQiShangQuanZuoQi(param1:Boolean, param2:Boolean) : void
      {
         this.checkZq.selectState = param1;
         this.checkDt.selectState = param2;
      }
   }
}

