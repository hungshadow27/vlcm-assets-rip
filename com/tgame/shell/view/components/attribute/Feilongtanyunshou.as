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
   import com.tgame.common.GameState;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.staticdata.ItemPositionRange;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.utils.ToolTips;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.common.vo.item.Skill;
   import com.tgame.moudels.feilongtanyunshou.model.info.FeiLongTanYunShouVO;
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
   
   public class Feilongtanyunshou extends Sprite
   {
      
      public static const UI_FEILONGTANYUNSHOUTUPO_GUANBI_CLICK:String = "UI_FEILONGTANYUNSHOUTUPO_GUANBI_CLICK";
      
      private var _$parent:DisplayObject;
      
      private var gongMc:MovieClip;
      
      private var gongMcSpr:Sprite;
      
      private var previousButton:FSimpleButton;
      
      private var nextButton:FSimpleButton;
      
      public var bgImg:Bitmap;
      
      private var tupoBo:Boolean = false;
      
      private var isLockOn:Boolean = false;
      
      private var fc:FCanvas;
      
      private var dqcs:FTextArea;
      
      private var sxjc1:FTextArea;
      
      private var sxjc:FTextArea;
      
      private var sxjcz:FTextArea;
      
      private var lb:FLabel;
      
      private var check1:FCheckBox;
      
      private var ft_ms:FTextArea;
      
      private var tf:TextFormat;
      
      private var lingWuBtn:SmallButton;
      
      private var fta:FTextArea;
      
      private var mainSkill:Skill;
      
      private var mainSkillItemFace:ItemFace;
      
      private var mainSkillContainer:Sprite;
      
      private var skillImg:Bitmap;
      
      private var p:Point;
      
      private var currSkill:ItemFace;
      
      private var isDragMainSkill:Boolean = false;
      
      private var feilongtanyunshoutupo:FeilongtanyunshouTupoCanvas;
      
      private var nowLevel:int;
      
      private var loadUrl:String;
      
      private var tipsMs:String = "";
      
      private var Song_bit:DisplayObject;
      
      private var vo:FeiLongTanYunShouVO;
      
      private var arr:Array;
      
      private var tootips1:String = "";
      
      private var fta8:FTextArea;
      
      private var fta9:FTextArea;
      
      private var tipCanvas:FCanvas;
      
      private var tip:FTextArea;
      
      private var mcObj:Object;
      
      private var lockImg:Bitmap;
      
      private var equipContainer:Sprite;
      
      private var cfts:Bitmap;
      
      private var fts:FTextArea;
      
      private var fts1:FTextArea;
      
      private var fts2:FTextArea;
      
      private var fts3:FTextArea;
      
      private var fts4:FTextArea;
      
      private var fts5:FTextArea;
      
      private var fts6:FTextArea;
      
      private var checkDt:FCheckBox;
      
      private var ynchk_hlz:FCheckBox;
      
      private var ynKuang:Bitmap;
      
      private var ynEquip:Sprite;
      
      private var ft_ynhlz:FTextArea;
      
      private var ynItemSpr:Sprite;
      
      private var isMainchar:Boolean = true;
      
      public function Feilongtanyunshou()
      {
         var $mask:Sprite;
         this.arr = [];
         this.mcObj = {};
         super();
         this.Song_bit = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/feilongtanyunshou/feilongtanyunshou.jpg",400,216);
         this.Song_bit.x = 0;
         this.Song_bit.y = 1;
         addChild(this.Song_bit);
         this.tf = new TextFormat();
         this.tf.align = "center";
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
         this.gongMcSpr = new Sprite();
         addChild(this.gongMcSpr);
         this.fc = new FCanvas();
         this.fc.x = 1;
         this.fc.y = 1;
         this.fc.width = 404;
         this.fc.height = 366;
         this.fc.skin = "box_transparence";
         addChild(this.fc);
         this.fc = new FCanvas();
         this.fc.x = 3;
         this.fc.y = 3;
         this.fc.width = 400;
         this.fc.height = 215;
         this.fc.skin = "box_transparence";
         addChild(this.fc);
         this.fc = new FCanvas();
         this.fc.x = 3;
         this.fc.y = 217;
         this.fc.width = 400;
         this.fc.height = 146;
         this.fc.skin = "box_transparence";
         addChild(this.fc);
         this.previousButton = new FSimpleButton();
         this.previousButton.skin = "previousButton";
         addChild(this.previousButton);
         this.previousButton.x = 140 + 5;
         this.previousButton.y = 195;
         this.previousButton.addEventListener(MouseEvent.CLICK,this.onClick);
         this.nextButton = new FSimpleButton();
         this.nextButton.skin = "nextButton";
         addChild(this.nextButton);
         this.nextButton.x = 235 - 5;
         this.nextButton.y = 195;
         this.nextButton.addEventListener(MouseEvent.CLICK,this.onClick);
         this.tf = new TextFormat();
         this.tf.align = "center";
         this.dqcs = new FTextArea();
         with(this.dqcs)
         {
            multiline = true;
            filters = StaticValue.filter;
            defaultTextFormat = tf;
            width = 75;
            height = 16;
            x = 160;
            y = 195;
            textColor = StaticValue.WHITE;
            htmlText = LanResManager.getLanCommonTextWords("第一层");
         }
         addChild(this.dqcs);
         this.sxjc1 = new FTextArea();
         with(this.sxjc1)
         {
            multiline = true;
            filters = StaticValue.filter;
            width = 190;
            height = 16;
            x = 205;
            y = 240 + 5;
            textColor = StaticValue.ORANGE;
            htmlText = LanResManager.getLanCommonTextWords("人物属性加成：");
         }
         addChild(this.sxjc1);
         this.sxjc = new FTextArea();
         with(this.sxjc)
         {
            multiline = true;
            filters = StaticValue.filter;
            width = 100;
            height = 110;
            x = 205;
            y = 255 + 5 + 5;
            textColor = StaticValue.ORANGE;
            htmlText = LanResManager.getLanTextWords(this,"攻击：防御：血量：内力：暴击：闪避：");
         }
         addChild(this.sxjc);
         this.sxjc1 = new FTextArea();
         with(this.sxjc1)
         {
            multiline = true;
            filters = StaticValue.filter;
            defaultTextFormat = tf;
            width = 90;
            height = 16;
            x = 290 - 14;
            y = 330;
            textColor = StaticValue.ORANGE;
            htmlText = LanResManager.getLanCommonTextWords("附带技能：");
         }
         addChild(this.sxjc1);
         this.skillImg = StaticValue.getBitmapByClassName("ui.tiem.slot");
         this.addChild(this.skillImg);
         this.skillImg.x = 361;
         this.skillImg.y = 321;
         this.mainSkillContainer = new Sprite();
         this.mainSkillContainer.x = 363;
         this.mainSkillContainer.y = 323;
         addChild(this.mainSkillContainer);
         this.mainSkillContainer.addEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDown);
         this.mainSkillContainer.addEventListener(MouseEvent.MOUSE_UP,this.onMouseUp);
         this.check1 = new FCheckBox();
         addChild(this.check1);
         this.check1.x = 205;
         this.check1.y = 220 + 5;
         this.check1.addEventListener(MouseEvent.CLICK,this.onClick);
         this.lb = new FLabel();
         with(this.lb)
         {
            x = 230;
            y = 220 + 5;
            textColor = StaticValue.GREEN;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("开启飞龙探云手使用");
         }
         addChild(this.lb);
         this.ft_ms = new FTextArea();
         with(this.ft_ms)
         {
            multiline = true;
            wordWrap = true;
            filters = StaticValue.filter;
            width = 190;
            height = 135;
            x = 5;
            y = 225;
            textColor = StaticValue.ORANGE_RED;
            htmlText = LanResManager.getLanTextWords(this,"飞龙探云手：");
         }
         addChild(this.ft_ms);
         this.ft_ms = new FTextArea();
         with(this.ft_ms)
         {
            multiline = true;
            wordWrap = true;
            filters = StaticValue.filter;
            width = 190;
            height = 135;
            x = 5;
            y = 250;
            textColor = 65276;
            htmlText = "";
         }
         addChild(this.ft_ms);
         this.fta8 = new FTextArea();
         with(this.fta8)
         {
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            x = 287 - 15 - 8;
            y = 287;
            textColor = StaticValue.RED;
            htmlText = LanResManager.getLanCommonTextWords("顶级激活进度：");
         }
         addChild(this.fta8);
         this.fta8.addEventListener(MouseEvent.MOUSE_OVER,this.onMouseTip);
         this.fta8.addEventListener(MouseEvent.MOUSE_OUT,this.onMouseTip);
         this.fta9 = new FTextArea();
         with(this.fta9)
         {
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            x = 369 + 15 - 8;
            y = 287;
            textColor = StaticValue.RED;
            htmlText = "100%";
            width = 100;
         }
         addChild(this.fta9);
         this.feilongtanyunshoutupo = new FeilongtanyunshouTupoCanvas();
         this.feilongtanyunshoutupo._parent2 = this;
         addChild(this.feilongtanyunshoutupo);
         this.feilongtanyunshoutupo.x = 138;
         this.feilongtanyunshoutupo.y = -10;
         $mask = new Sprite();
         $mask.mouseEnabled = false;
         addChild($mask);
         $mask.x = 410;
         $mask.y = -10;
         with($mask.graphics)
         {
            beginFill(16711680,0.5);
            drawRect(0,0,280,390);
            endFill();
         }
         this.feilongtanyunshoutupo.mask = $mask;
         addEventListener(UI_FEILONGTANYUNSHOUTUPO_GUANBI_CLICK,this.aa1);
         this.lockImg = StaticValue.getBitmapByClassName("ui.char.xunzhang.kuang");
         this.lockImg.x = 25 + 2;
         this.lockImg.y = 160 + 2;
         this.equipContainer = new Sprite();
         this.equipContainer.x = 25;
         this.equipContainer.y = 160;
         with(this.equipContainer.graphics)
         {
            beginFill(16711680,0);
            drawRect(0,0,40,40);
            endFill();
         }
         addChild(this.equipContainer);
         this.fts = new FTextArea();
         this.fts.x = 10;
         this.fts.y = 10;
         this.fts.textColor = StaticValue.RED;
         this.fts.width = 170;
         this.fts.height = 20;
         this.fts.htmlText = LanResManager.getLanCommonTextWords("飞龙终极一击术(未激活)");
         addChild(this.fts);
         ToolTips.createToolTips(this.fts,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("攻击2888888、防御 2288888、血量388888888、暴击888、闪避888 ") + "<br>" + LanResManager.getLanCommonTextWords("飞龙偷龙转凤术 ：攻击时有几率触发该技能，可牺牲自身防御20%后获得") + "<br>" + LanResManager.getLanCommonTextWords("血量100% 翻倍效果，且血量在成功触发技能后100%回复满值") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.fts1 = new FTextArea();
         this.fts1.x = 10;
         this.fts1.y = 28;
         this.fts1.textColor = StaticValue.RED;
         this.fts1.width = 220;
         this.fts1.height = 20;
         addChild(this.fts1);
         ToolTips.createToolTips(this.fts1,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("攻击8888888 防御6888888 血量18888888 暴击888 闪避888") + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.fts2 = new FTextArea();
         this.fts2.x = 85 + 205 + 38;
         this.fts2.y = 155 - 141;
         this.fts2.textColor = StaticValue.GREEN;
         this.fts2.width = 200;
         this.fts2.height = 50;
         addChild(this.fts2);
         this.fts3 = new FTextArea();
         this.fts3.x = 10;
         this.fts3.y = 7 + 20 + 20;
         this.fts3.textColor = StaticValue.GREEN;
         this.fts3.width = 120;
         this.fts3.height = 20;
         this.fts3.htmlText = LanResManager.getLanCommonTextWords("偷龙转凤决（已激活）");
         this.fts3.visible = false;
         addChild(this.fts3);
         ToolTips.createToolTips(this.fts3,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("攻击：2222亿、防御1288亿、暴击 88888、闪避 88888、血量3222亿、所有武功提升 40000层") + "<br>" + LanResManager.getLanCommonTextWords("偷龙转凤（特殊技能）：攻击时有几率触发飞龙隐藏特技，每次攻击都必定回复自身总血量10%；且") + "<br>" + LanResManager.getLanCommonTextWords("在效果期间内，每攻击对手一次，对手额外损失当前20%血量。效果持续8秒。") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.fts4 = new FTextArea();
         this.fts4.x = 10;
         this.fts4.y = 7 + 20 + 20 + 20;
         this.fts4.textColor = StaticValue.GREEN;
         this.fts4.width = 120;
         this.fts4.height = 20;
         this.fts4.htmlText = LanResManager.getLanCommonTextWords("人魔合一（已激活）");
         this.fts4.visible = false;
         addChild(this.fts4);
         ToolTips.createToolTips(this.fts4,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("特殊属性：攻击：80888亿、防御60888亿、血量80888亿、所有武功提升 5600000层 攻速+388") + "<br>" + LanResManager.getLanCommonTextWords("人魔合一：红魔噬血，天下万变。攻击时100%触发人魔合一，持续10秒；自身在此状态下，每次") + "<br>" + LanResManager.getLanCommonTextWords("受到的攻击都将被红魔剑吸收，所有效果都将被红魔吞噬， 且在人魔合一状态下，每秒都可将5") + "<br>" + LanResManager.getLanCommonTextWords("格范围内的所有玩家受到红魔的影响，无法使用任何技能，持续10秒。冷却60秒。") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.fts5 = new FTextArea();
         this.fts5.x = 10;
         this.fts5.y = 7 + 20 + 20 + 20 + 20;
         this.fts5.textColor = StaticValue.GREEN;
         this.fts5.width = 120;
         this.fts5.height = 20;
         this.fts5.htmlText = LanResManager.getLanCommonTextWords("飞天术（（已激活）");
         this.fts5.visible = false;
         addChild(this.fts5);
         ToolTips.createToolTips(this.fts5,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("翩翩起舞：攻击时有几率触发翩翩起舞状态，持续10秒。自身一旦受到对手攻击，自身将立即消") + "<br>" + LanResManager.getLanCommonTextWords("失在对手视野，使对手失去目标，持续5秒。自身飞上九重天，受到万佛庇佑，瞬间从天击打对") + "<br>" + LanResManager.getLanCommonTextWords("手，使对手瞬间掉血80%，并且定身在原地。持续5秒。") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.fts6 = new FTextArea();
         this.fts6.x = 10;
         this.fts6.y = 7 + 20 + 20 + 20 + 20 + 25;
         this.fts6.textColor = StaticValue.GREEN;
         this.fts6.width = 110;
         this.fts6.height = 20;
         this.fts6.htmlText = LanResManager.getLanCommonTextWords("火龙珠");
         this.fts6.visible = false;
         addChild(this.fts6);
         ToolTips.createToolTips(this.fts6,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("特殊属性：攻击10888888889000 防御8888888889000 血量12888888889000暴击88888闪避88888 所有武功2800000层") + "<br>" + LanResManager.getLanCommonTextWords("火龙珠：上古魔龙族至尊圣物，表面如水晶般光亮却包染着一层不灭的火焰，人物可自己切换龙珠守护。") + "<br>" + LanResManager.getLanCommonTextWords("龙珠噬魂：攻击时100%触发龙珠噬魂，持续15秒；在此状态下，自身每攻击对手一次，都将瞬间吞噬对手的灵魂使其呆滞原地，") + "<br>" + LanResManager.getLanCommonTextWords("持续10秒；且每命中一个对手，对手的灵魂将被龙珠吞噬给矛补充龙元，当攻击5次获得5个龙元时可瞬间触发龙珠灵魄效果，") + "<br>" + LanResManager.getLanCommonTextWords("使范围5格内的所有对手弹出，且自身无敌5秒。冷却60秒。") + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.checkDt = new FCheckBox();
         addChild(this.checkDt);
         this.checkDt.visible = false;
         this.checkDt.x = 120;
         this.checkDt.y = 7 + 20 + 20 + 20 + 20 + 25;
         this.checkDt.addEventListener(MouseEvent.CLICK,this.onCheckClick);
         this.ynEquip = new Sprite();
         with(this.ynEquip.graphics)
         {
            beginFill(16711680,0);
            drawRect(0,0,220,80);
            endFill();
         }
         this.ynEquip.x = 340;
         this.ynEquip.y = 145;
         addChild(this.ynEquip);
         this.ynEquip.addEventListener(MouseEvent.MOUSE_UP,this.onItemClick,false,30);
         this.ynchk_hlz = new FCheckBox();
         this.ynchk_hlz.name = "3";
         addChild(this.ynchk_hlz);
         this.ynchk_hlz.textColor = StaticValue.WHITE;
         this.ynchk_hlz.x = 235;
         this.ynchk_hlz.y = 160;
         this.ynchk_hlz.addEventListener(MouseEvent.CLICK,this.onCheckClickYN);
         this.ft_ynhlz = new FTextArea();
         this.ft_ynhlz.x = 235 + 30;
         this.ft_ynhlz.y = 160;
         this.ft_ynhlz.width = 65;
         this.ft_ynhlz.textColor = StaticValue.WHITE;
         this.ft_ynhlz.htmlText = LanResManager.getLanCommonTextWords("火龙珠气旋");
         addChild(this.ft_ynhlz);
         this.ynKuang = StaticValue.getBitmapByClassName("ui.tiem.slot");
         this.ynKuang.x = 2;
         this.ynKuang.y = 0;
         this.ynEquip.addChild(this.ynKuang);
         this.ynKuang = StaticValue.getBitmapByClassName("ui.tiem.slot");
         this.ynKuang.x = 2;
         this.ynKuang.y = -38;
         this.ynEquip.addChild(this.ynKuang);
         this.ynItemSpr = new Sprite();
         this.ynEquip.addChild(this.ynItemSpr);
         this.lingWuBtn = new SmallButton();
         this.lingWuBtn.label = LanResManager.getLanCommonTextWords("突破本层");
         addChild(this.lingWuBtn);
         this.lingWuBtn.x = 335;
         this.lingWuBtn.y = 195 - 1;
         this.lingWuBtn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function onCheckClickYN(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.ynchk_hlz:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_YUENANDINGZHI_QIXUAN_ZIDONGHUANZHUANG,"",[param1.target.selectState,param1.target.name]));
         }
      }
      
      private function onItemClick(param1:MouseEvent) : void
      {
         if(!this.isLockOn)
         {
            this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_CHAR_ATTRIBUTE_MENU_SHOW,"",param1));
         }
      }
      
      private function onCheckClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.checkDt:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.checkDt.selectState,86]));
         }
      }
      
      private function onMouseTip(param1:MouseEvent) : void
      {
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               this.fta8.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTip);
               break;
            case MouseEvent.MOUSE_MOVE:
               this.showTip1(this.tootips1);
               break;
            case MouseEvent.MOUSE_OUT:
               if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
               this.fta8.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTip);
         }
      }
      
      private function showTip1(param1:String) : void
      {
         this.tip.htmlText = param1;
         Tools.currentStage.addChild(this.tipCanvas);
         this.tipCanvas.width = this.tip.width + 4;
         this.tipCanvas.height = this.tip.height + 4;
         this.tipCanvas.x = Tools.currentStage.mouseX + 15;
         this.tipCanvas.y = Tools.currentStage.mouseY + 25;
      }
      
      private function onMouseDown(param1:MouseEvent) : void
      {
         this.mainSkillContainer.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
         this.p = new Point(mouseX,mouseY);
         this.currSkill = param1.target as ItemFace;
      }
      
      private function onMouseMove(param1:MouseEvent) : void
      {
         if(this.currSkill != param1.target)
         {
            this.mainSkillContainer.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
            return;
         }
      }
      
      private function onMouseUp(param1:MouseEvent) : void
      {
         this.mainSkillContainer.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
      }
      
      public function set setParent(param1:DisplayObject) : void
      {
         this._$parent = param1;
         this.feilongtanyunshoutupo._parent2 = param1;
         this.feilongtanyunshoutupo._parent3 = this;
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.previousButton:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_FEILONGTANYUNSHOU_PREVIOUS_CLICK));
               break;
            case this.nextButton:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_FEILONGTANYUNSHOU_NEXT_CLICK));
               break;
            case this.lingWuBtn:
               if(this.tupoBo)
               {
                  return;
               }
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_FEILONGTANYUNSHOU_LINGWU_SHOW,""));
         }
         switch(param1.currentTarget)
         {
            case this.check1:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_FEILONGTANYUNSHOU_SHIFOUSHIYONG_CLICK,"",this.check1.selectState ? true : false));
         }
      }
      
      public function removeMc() : void
      {
         if(Boolean(this.gongMc) && this.gongMc.parent != null)
         {
            this.gongMc.stop();
            this.gongMc.parent.removeChild(this.gongMc);
         }
         while(this.gongMcSpr.numChildren > 0)
         {
            this.gongMcSpr.removeChildAt(0);
         }
      }
      
      public function initilizeUI(param1:Boolean, param2:FeiLongTanYunShouVO) : void
      {
         this.setZhaoShiMsg(param2.nowLookingName,param2.nowLookingID,param2.nowID + 1,param2.nowID >= 15);
         this.setMainInitialize(param2.hp,param2.mp,param2.cp,param2.act,param2.def,param2.MiaoShu);
         this.setSkill(new Skill(param2.skillID),param2.nowID);
         this.setFeiongtanyunshouUse(param2.isUseSkill);
         this.set_FLTYS(new Goods(9760),param2.lkzx);
         this.setZhongJi(param2.zhongJi);
         this.setXiangLongMenghuanJindan(param1);
         this.checkDt.selectState = param2.isDanTian;
      }
      
      public function setZhongJi(param1:Boolean) : void
      {
         if(param1)
         {
            this.fts.textColor = StaticValue.GREEN;
            this.fts.htmlText = LanResManager.getLanCommonTextWords("飞龙终极一击术(已激活)");
         }
         else
         {
            this.fts.textColor = StaticValue.RED;
            this.fts.htmlText = LanResManager.getLanCommonTextWords("飞龙终极一击术(未激活)");
         }
      }
      
      private function setMainInitialize(param1:int, param2:int, param3:int, param4:int, param5:int, param6:String) : void
      {
         var _loc7_:String = "";
         _loc7_ = _loc7_ + ("<textformat leading=\'4\'><font color=\'" + StaticValue.ORANGE + "\'>");
         _loc7_ = _loc7_ + (LanResManager.getLanCommonTextWords("攻击：+") + param4 + "<br>" + LanResManager.getLanCommonTextWords("防御：+") + param5 + "<br>" + LanResManager.getLanCommonTextWords("生命：+") + param1 + "<br>" + LanResManager.getLanCommonTextWords("内力：+") + param2 + "<br>" + LanResManager.getLanCommonTextWords("体力：+") + param3 + "<br>");
         _loc7_ = _loc7_ + "</font>";
         _loc7_ = _loc7_ + "</textformat>";
         this.sxjc.htmlText = _loc7_;
         this.ft_ms.htmlText = param6;
      }
      
      public function setZhaoShiMsg(param1:String, param2:int, param3:int = -1, param4:Boolean = false) : void
      {
         var swf:int = 0;
         var str1:String = param1;
         var int1:int = param2;
         var int2:int = param3;
         var isAllColplete:Boolean = param4;
         this.dqcs.htmlText = str1;
         swf = 0;
         if(int1 == 1 || int1 == 2 || int1 == 3 || int1 == 0)
         {
            swf = 1;
         }
         else if(int1 == 4 || int1 == 5 || int1 == 6)
         {
            swf = 2;
         }
         else if(int1 == 7 || int1 == 8 || int1 == 9)
         {
            swf = 3;
         }
         else if(int1 == 10 || int1 == 11 || int1 == 12)
         {
            swf = 4;
         }
         else if(int1 == 13 || int1 == 14)
         {
            swf = 5;
         }
         else
         {
            swf = 6;
         }
         this.loadUrl = GameConfig.fileBaseFolder + "res/data/mc/feilongtanyunshou/L" + swf + ".swf";
         if(Boolean(this.gongMc) && this.gongMc.parent != null)
         {
            this.gongMc.stop();
            this.gongMc.parent.removeChild(this.gongMc);
         }
         while(this.gongMcSpr.numChildren > 0)
         {
            this.gongMcSpr.removeChildAt(0);
         }
         if(this.mcObj[swf] != null)
         {
            this.gongMc = this.mcObj[swf];
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
               mcObj[swf] = gongMc;
               if(gongMc)
               {
                  gongMcSpr.addChild(gongMc);
               }
            },null,false,this.loadUrl);
         }
         this.nowLevel = int1;
         this.previousButtonEnabled(true);
         this.lingWuButtonEnabled(true);
         this.nextButtonEnabled(true);
         if(int1 == int2 || int1 == 0)
         {
            this.lingWuBtn.label = LanResManager.getLanCommonTextWords("突破本层");
            this.lingWuButtonEnabled(true);
         }
         else if(int1 < int2)
         {
            this.lingWuBtn.label = LanResManager.getLanCommonTextWords("已突破");
            this.lingWuButtonEnabled(false);
         }
         else
         {
            this.lingWuBtn.label = LanResManager.getLanCommonTextWords("未突破");
            this.lingWuButtonEnabled(false);
         }
         if(isAllColplete || int2 == -1)
         {
            this.lingWuButtonEnabled(false);
         }
         if(this.isLockOn)
         {
            this.lingWuBtn.label = LanResManager.getLanCommonTextWords("突破本层");
         }
         if(int1 == 1)
         {
            this.previousButtonEnabled(false);
         }
         if(int1 == 15)
         {
            this.nextButtonEnabled(false);
         }
         if(int1 == int2 && int1 == 1)
         {
            this.check1.enabled = false;
         }
         else
         {
            this.check1.enabled = true;
         }
      }
      
      public function setSkill(param1:Skill, param2:int) : void
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
         this.mainSkill = param1;
         if(param2 == 0)
         {
            this.mainSkill.isLearn = 0;
            this.mainSkill.level = 0;
         }
         else
         {
            this.mainSkill.isLearn = 1;
            this.mainSkill.level = param2;
         }
         this.mainSkillItemFace = new ItemFace(this.mainSkill);
         this.mainSkillItemFace.showKungFuTag();
         this.mainSkillItemFace.setShowCount(false);
         this.mainSkillContainer.addChild(this.mainSkillItemFace);
      }
      
      public function showFeilongtanyunshougLingWuPanel(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.feilongtanyunshoutupo.x == 138)
            {
               TweenMax.to(this.feilongtanyunshoutupo,1,{"x":410});
               this.tupoBo = true;
               this.previousButtonEnabled(false);
               this.nextButtonEnabled(false);
               this.lingWuButtonEnabled(false);
            }
         }
         else if(this.feilongtanyunshoutupo.x == 410)
         {
            TweenMax.to(this.feilongtanyunshoutupo,1,{"x":138});
            this.tupoBo = false;
            this.previousButtonEnabled(true);
            this.nextButtonEnabled(true);
            this.lingWuButtonEnabled(true);
            if(this.nowLevel == 1)
            {
               this.previousButtonEnabled(false);
            }
            if(this.nowLevel == 15)
            {
               this.nextButtonEnabled(false);
            }
            this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_FEILONGTANYUNSHOU_ZIDONGTISHENG_CLICKJ,"",false));
         }
      }
      
      public function isFeilongtanyunshoutupoCanvasShow() : Boolean
      {
         if(this.feilongtanyunshoutupo.x == 410)
         {
            return true;
         }
         return false;
      }
      
      public function setInitialize(param1:String, param2:Boolean, param3:String, param4:int, param5:Boolean, param6:int) : void
      {
         this.feilongtanyunshoutupo.setInitialize(param1,param2,param3,param4,param5,param6);
      }
      
      public function setZhufuzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this.feilongtanyunshoutupo.setZhufuzhi(param1,param2,param3);
      }
      
      public function setGoods(param1:Goods, param2:Boolean) : void
      {
         this.feilongtanyunshoutupo.setGoods(param1,param2);
      }
      
      public function setShuoming(param1:String) : void
      {
         this.feilongtanyunshoutupo.setShuoming(param1);
      }
      
      public function setBtn(param1:Boolean) : void
      {
         this.feilongtanyunshoutupo.setBtn(param1);
      }
      
      public function closeMiniPanel() : void
      {
         if(this.feilongtanyunshoutupo.x == 410)
         {
            TweenMax.to(this.feilongtanyunshoutupo,1,{"x":138});
            this.tupoBo = false;
            this.previousButtonEnabled(true);
            this.nextButtonEnabled(true);
            this.lingWuButtonEnabled(true);
            if(this.nowLevel == 1)
            {
               this.previousButtonEnabled(false);
            }
            if(this.nowLevel == 15)
            {
               this.nextButtonEnabled(false);
            }
         }
      }
      
      private function aa1(param1:BaseEvent) : void
      {
         this.showFeilongtanyunshougLingWuPanel(false);
      }
      
      public function lockOn(param1:int) : void
      {
         var swf:int = 0;
         var int2:int = param1;
         this.previousButtonEnabled(false);
         this.nextButtonEnabled(false);
         this.lingWuButtonEnabled(false);
         this.check1.enabled = false;
         this.ynEquip.mouseChildren = false;
         this.ynEquip.mouseEnabled = false;
         this.ynchk_hlz.enabled = false;
         this.ynItemSpr.mouseChildren = false;
         this.ynItemSpr.mouseEnabled = false;
         this.isMainchar = false;
         swf = 0;
         if(int2 == 1 || int2 == 2 || int2 == 3 || int2 == 0)
         {
            swf = 1;
         }
         else if(int2 == 4 || int2 == 5 || int2 == 6)
         {
            swf = 2;
         }
         else if(int2 == 7 || int2 == 8 || int2 == 9)
         {
            swf = 3;
         }
         else if(int2 == 10 || int2 == 11 || int2 == 12)
         {
            swf = 4;
         }
         else if(int2 == 13 || int2 == 14)
         {
            swf = 5;
         }
         else
         {
            swf = 6;
         }
         this.loadUrl = GameConfig.fileBaseFolder + "res/data/mc/feilongtanyunshou/L" + swf + ".swf";
         if(this.mcObj[swf] != null)
         {
            this.gongMc = this.mcObj[swf];
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
               mcObj[swf] = gongMc;
               gongMc = _loc2_.content as MovieClip;
               if(gongMc)
               {
                  gongMcSpr.addChild(gongMc);
               }
            },null,false,this.loadUrl);
         }
      }
      
      private function previousButtonEnabled(param1:Boolean) : void
      {
         this.previousButton.enabled = param1;
      }
      
      private function nextButtonEnabled(param1:Boolean) : void
      {
         this.nextButton.enabled = param1;
      }
      
      private function lingWuButtonEnabled(param1:Boolean) : void
      {
         this.lingWuBtn.enabled = param1;
      }
      
      public function setFeiongtanyunshouUse(param1:Boolean) : void
      {
         this.check1.selectState = param1;
      }
      
      public function menuToolTip(param1:String) : void
      {
         this.tootips1 = param1;
      }
      
      public function setJinduNum(param1:int, param2:Boolean) : void
      {
         if(param2)
         {
            this.fta8.visible = true;
            this.fta9.visible = true;
         }
         else
         {
            this.fta8.visible = false;
            this.fta9.visible = false;
         }
         this.fta9.htmlText = param1 + "%";
      }
      
      public function set_FLTYS(param1:Goods, param2:int) : void
      {
         while(this.equipContainer.numChildren > 0)
         {
            this.equipContainer.removeChildAt(0);
         }
         var _loc3_:ItemFace = new ItemFace(param1);
         _loc3_.x = 4 + 1;
         _loc3_.y = 4 + 1;
         if(param2 == 0)
         {
            _loc3_.filters = Tools.blackWhiteFilter;
         }
         this.equipContainer.addChild(_loc3_);
      }
      
      public function setJiHuo(param1:Boolean) : void
      {
         if(param1)
         {
            this.fts1.textColor = StaticValue.GREEN;
            this.fts1.htmlText = LanResManager.getLanCommonTextWords("飞龙毁天掌(已激活)");
         }
         else
         {
            this.fts1.textColor = StaticValue.RED;
            this.fts1.htmlText = LanResManager.getLanCommonTextWords("飞龙毁天掌(未激活)");
         }
      }
      
      public function setXiangLongMenghuanJindan(param1:Boolean) : void
      {
         var isMainChar:Boolean = param1;
         if(isMainChar)
         {
            this.fts2.htmlText = LanResManager.getLanCommonTextWords("已吃") + GameState.dictMainStatus[SpecialGoodsID.MENGHUAN_FEILONGTANYUNSHOU_ID] + LanResManager.getLanCommonTextWords("个") + "<br>" + LanResManager.getLanCommonTextWords("梦幻飞龙石");
            ToolTips.createToolTips(this.fts2,this,function():String
            {
               var _loc1_:String = "";
               _loc1_ += "<textformat leading=\'6\'>";
               _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("增加攻击:") + GameState.dictMainStatus[SpecialGoodsID.MENGHUAN_FEILONGTANYUNSHOU_ID] * 10000 + "," + LanResManager.getLanCommonTextWords("武功层数:") + GameState.dictMainStatus[SpecialGoodsID.MENGHUAN_FEILONGTANYUNSHOU_ID] * 1 + "</font>";
               return _loc1_ + "</textformat>";
            });
            this.fts3.visible = GameState.dictMainStatus[SpecialGoodsID.FEILONGTANYUNSHOU_TOULONGZHUANFENG];
            this.fts4.visible = GameState.dictMainStatus[SpecialGoodsID.FEILONGTANYUNSHOU_RENMOHEYI_ID];
            this.fts5.visible = GameState.dictMainStatus[SpecialGoodsID.FEILONGTANYUNSHOU_FEITIANSHU_ID];
         }
         else
         {
            this.fts2.htmlText = LanResManager.getLanCommonTextWords("已吃") + GameState.dictTargetStatus[SpecialGoodsID.MENGHUAN_FEILONGTANYUNSHOU_ID] + LanResManager.getLanCommonTextWords("个") + "<br>" + LanResManager.getLanCommonTextWords("梦幻飞龙石");
            ToolTips.createToolTips(this.fts2,this,function():String
            {
               var _loc1_:String = "";
               _loc1_ += "<textformat leading=\'6\'>";
               _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("增加攻击:") + GameState.dictTargetStatus[SpecialGoodsID.MENGHUAN_FEILONGTANYUNSHOU_ID] * 10000 + "," + LanResManager.getLanCommonTextWords("武功层数:") + GameState.dictTargetStatus[SpecialGoodsID.MENGHUAN_FEILONGTANYUNSHOU_ID] * 1 + "</font>";
               return _loc1_ + "</textformat>";
            });
            this.fts3.visible = GameState.dictTargetStatus[SpecialGoodsID.FEILONGTANYUNSHOU_TOULONGZHUANFENG];
            this.fts4.visible = GameState.dictTargetStatus[SpecialGoodsID.FEILONGTANYUNSHOU_RENMOHEYI_ID];
            this.fts5.visible = GameState.dictTargetStatus[SpecialGoodsID.FEILONGTANYUNSHOU_FEITIANSHU_ID];
         }
      }
      
      public function showYN_HLZ(param1:Boolean) : void
      {
         this.ynchk_hlz.enabled = param1;
         this.ft_ynhlz.visible = this.ynchk_hlz.visible;
         if(param1 == false)
         {
            this.ynchk_hlz.selectState = false;
         }
      }
      
      public function setCHK_HLZ(param1:Boolean) : void
      {
         this.ynchk_hlz.selectState = param1;
      }
      
      public function setYN(param1:Array) : void
      {
         var _loc3_:Goods = null;
         var _loc4_:ItemFace = null;
         while(this.ynItemSpr.numChildren > 0)
         {
            this.ynItemSpr.removeChildAt(0);
         }
         if(!this.isMainchar)
         {
            this.ynEquip.mouseEnabled = false;
         }
         else
         {
            this.ynEquip.mouseEnabled = true;
         }
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            _loc3_ = param1[_loc2_] as Goods;
            _loc4_ = new ItemFace(_loc3_);
            if(_loc3_.res.position == ItemPositionRange.POSITION_HUOLONGZHU)
            {
               _loc4_.x = 4;
               _loc4_.y = 2;
               this.ynItemSpr.addChild(_loc4_);
            }
            else if(_loc3_.res.position == ItemPositionRange.POSITION_20180926XUNZHANG_94)
            {
               _loc4_.x = 4;
               _loc4_.y = -36;
               this.ynItemSpr.addChild(_loc4_);
            }
            _loc2_++;
         }
      }
   }
}

