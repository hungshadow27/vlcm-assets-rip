package com.tgame.shell.view.components.attribute
{
   import com.fireice.checkBox.FCheckBox;
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.FLoader;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.GameState;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.staticdata.ItemPositionRange;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.common.utils.ToolTips;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.common.vo.item.Skill;
   import com.tgame.shell.view.components.CharAttribute;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.*;
   import flash.utils.getDefinitionByName;
   import gs.TweenMax;
   
   public class JingJie extends Sprite
   {
      
      public static const UI_JINGJIE_GUANBI_CLICK:String = "UI_JINGJIE_GUANBI_CLICK";
      
      public var _parent:DisplayObject;
      
      public var bg:Bitmap;
      
      private var tipCanvas:FCanvas;
      
      private var tip:FTextArea;
      
      private var fta:FTextArea;
      
      private var gongImg:DisplayObject;
      
      private var fta1:FTextArea;
      
      private var fta2:FTextArea;
      
      private var btn1:SimpleButton;
      
      private var btn2:SimpleButton;
      
      private var btn3:SimpleButton;
      
      private var btn4:SimpleButton;
      
      private var btn5:SimpleButton;
      
      private var btn6:SimpleButton;
      
      private var btn7:SimpleButton;
      
      private var btn8:SimpleButton;
      
      private var btn9:SimpleButton;
      
      private var btn10:SimpleButton;
      
      private var toolTipStr1:String = "";
      
      private var toolTipStr2:String = "";
      
      private var toolTipStr3:String = "";
      
      private var toolTipStr4:String = "";
      
      private var toolTipStr5:String = "";
      
      private var toolTipStr6:String = "";
      
      private var toolTipStr7:String = "";
      
      private var toolTipStr8:String = "";
      
      private var toolTipStr9:String = "";
      
      private var toolTipStr10:String = "";
      
      private var tf:TextFormat;
      
      private var lingWuBtn:SmallButton;
      
      private var shuoMingBtn:SmallButton;
      
      private var jingjietupoCanvas:JingJieTuPoCanvas;
      
      private var bt:Bitmap;
      
      private var bt2:Bitmap;
      
      private var $class:Class;
      
      private var anniuContainer:Sprite;
      
      private var fc:FCanvas;
      
      private var fc2:FCanvas;
      
      private var shuomingPanel:JingJieshuoming;
      
      private var gongImgObj:Object;
      
      private var isLockOn:Boolean = false;
      
      private var lockImg:Bitmap;
      
      private var equipContainer:Sprite;
      
      private var cfts:Bitmap;
      
      private var npcs:Bitmap;
      
      private var lyggSkillContainer:Sprite;
      
      private var fts:FTextArea;
      
      private var fts1:FTextArea;
      
      private var tongtianshi:int = 0;
      
      private var fts2:FTextArea;
      
      private var zhanli:int = 0;
      
      private var qiangzhe:int = 0;
      
      private var shendun:int = 0;
      
      private var kuangbao:int = 0;
      
      private var shunying:int = 0;
      
      private var qiangsheng:int = 0;
      
      private var fts3:FTextArea;
      
      public var check:FCheckBox;
      
      private var checkLabel:FLabel;
      
      private var fts4:FTextArea;
      
      private var fts5:FTextArea;
      
      private var fts6:FTextArea;
      
      private var xiongshouBg0:DisplayObject;
      
      private var xiongshouBg1:DisplayObject;
      
      private var xiongshouBg2:DisplayObject;
      
      private var xiongshouBg3:DisplayObject;
      
      private var xiongshouBg4:DisplayObject;
      
      private var xiongshouBg5:DisplayObject;
      
      private var xiongshouBg6:DisplayObject;
      
      private var xiongshouBg7:DisplayObject;
      
      private var xiongshouBg8:DisplayObject;
      
      private var xiongshouBg9:DisplayObject;
      
      private var xiongshouCount:int = 0;
      
      private var fts7:FTextArea;
      
      private var check1:FCheckBox;
      
      public function JingJie()
      {
         var jianXArr:Array;
         var jianYArr:Array;
         var i:int;
         var $mask:Sprite;
         this.gongImgObj = {};
         super();
         this.fc2 = new FCanvas();
         this.fc2.x = 0;
         this.fc2.y = 0;
         this.fc2.width = 184;
         this.fc2.height = 365;
         this.fc2.skin = "box_transparence";
         addChild(this.fc2);
         this.fc = new FCanvas();
         this.fc.x = 183;
         this.fc.y = 0;
         this.fc.width = 221;
         this.fc.height = 365;
         this.fc.skin = "box_transparence";
         addChild(this.fc);
         this.bt = StaticValue.getBitmapByClassName("ui.char.jingjie.bg1");
         addChild(this.bt);
         this.bt.x = 1;
         this.bt.y = 2;
         this.bt2 = StaticValue.getBitmapByClassName("ui.char.jingjie.bg2");
         addChild(this.bt2);
         this.bt2.x = 184;
         this.bt2.y = 2;
         this.tipCanvas = new FCanvas();
         this.tipCanvas.skin = "backGroud";
         this.tf = new TextFormat();
         this.tf.align = "center";
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
         jianXArr = [115,35,100,28,110,63,115,33,65,76];
         jianYArr = [304,270,225,195,166,135,102,78,47,3];
         i = 0;
         while(i < 10)
         {
            this["xiongshouBg" + i] = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/jingjie/guangxiao.swf");
            this["xiongshouBg" + i].x = jianXArr[i];
            this["xiongshouBg" + i].y = jianYArr[i];
            addChild(this["xiongshouBg" + i]);
            i++;
         }
         this.anniuContainer = new Sprite();
         this.anniuContainer.x = 0;
         this.anniuContainer.y = 0;
         addChild(this.anniuContainer);
         this.lingWuBtn = new SmallButton();
         this.lingWuBtn.label = "";
         addChild(this.lingWuBtn);
         this.lingWuBtn.x = 310;
         this.lingWuBtn.y = 222;
         this.lingWuBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.shuoMingBtn = new SmallButton();
         this.shuoMingBtn.label = LanResManager.getLanCommonTextWords("境界说明");
         addChild(this.shuoMingBtn);
         this.shuoMingBtn.x = 105;
         this.shuoMingBtn.y = 8;
         this.shuoMingBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.fta = new FTextArea();
         with(this.fta)
         {
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            x = 205;
            y = 260;
            textColor = StaticValue.GREEN;
            htmlText = LanResManager.getLanCommonTextWords("本境界获得属性提升：");
         }
         addChild(this.fta);
         this.fta1 = new FTextArea();
         with(this.fta1)
         {
            filters = StaticValue.filter;
            x = 205;
            y = 280;
            autoSize = TextFieldAutoSize.LEFT;
            htmlText = "";
         }
         addChild(this.fta1);
         this.fta2 = new FTextArea();
         with(this.fta2)
         {
            filters = StaticValue.filter;
            x = 300;
            y = 280;
            autoSize = TextFieldAutoSize.LEFT;
            htmlText = "";
         }
         addChild(this.fta2);
         this.lockImg = StaticValue.getBitmapByClassName("ui.char.xunzhang.kuang");
         this.lockImg.x = 300 + 2 + 20;
         this.lockImg.y = 300 + 2 + 10;
         this.lockImg = StaticValue.getBitmapByClassName("ui.char.xunzhang.kuang");
         this.addChild(this.lockImg);
         this.lockImg.x = 300 + 2 + 60;
         this.lockImg.y = 300 + 2 + 10;
         this.equipContainer = new Sprite();
         this.equipContainer.x = 300 + 20;
         this.equipContainer.y = 300 + 10;
         with(this.equipContainer.graphics)
         {
            beginFill(16711680,0);
            drawRect(0,0,100,40);
            endFill();
         }
         this.equipContainer.addEventListener(MouseEvent.MOUSE_UP,this.onItemClick,false,30);
         addChild(this.equipContainer);
         this.jingjietupoCanvas = new JingJieTuPoCanvas();
         addChild(this.jingjietupoCanvas);
         this.jingjietupoCanvas.x = -15;
         this.jingjietupoCanvas.y = 380;
         $mask = new Sprite();
         $mask.mouseEnabled = false;
         addChild($mask);
         $mask.x = -15;
         $mask.y = 264;
         with($mask.graphics)
         {
            beginFill(16711680,0.5);
            drawRect(0,0,425,110);
            endFill();
         }
         this.jingjietupoCanvas.mask = $mask;
         addEventListener(UI_JINGJIE_GUANBI_CLICK,this.aa1);
         this.lyggSkillContainer = new Sprite();
         this.lyggSkillContainer.x = 187;
         this.lyggSkillContainer.y = 205;
         with(this.lyggSkillContainer.graphics)
         {
            beginFill(16711680,0);
            drawRect(0,0,40,40);
            endFill();
         }
         addChild(this.lyggSkillContainer);
         this.fts = new FTextArea();
         this.fts.x = 228;
         this.fts.y = 7;
         this.fts.textColor = StaticValue.RED;
         this.fts.width = 170;
         this.fts.height = 20;
         this.fts.filters = StaticValue.filter;
         this.fts.htmlText = LanResManager.getLanCommonTextWords("境界-位列仙班已激活");
         addChild(this.fts);
         ToolTips.createToolTips(this.fts,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("境界-位列仙班已激活") + "<br>" + LanResManager.getLanCommonTextWords("增加人物属性 攻击2888888、防御2288888、血量388888888、暴击888、闪避888") + "<br>" + LanResManager.getLanCommonTextWords("境界-位列仙班特技:10%的几率触发无敌状态效果3秒；人物防御属性提升20%、生命属性提升50%") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.fts1 = new FTextArea();
         this.fts1.x = 228;
         this.fts1.y = 7 + 20;
         this.fts1.textColor = StaticValue.GREEN;
         this.fts1.width = 170 + 20;
         this.fts1.height = 20;
         this.fts1.htmlText = LanResManager.getLanCommonTextWords("境界内功心法秘籍（已激活）");
         this.fts1.visible = false;
         addChild(this.fts1);
         ToolTips.createToolTips(this.fts1,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("提升属性：攻击：56888亿、防御52888亿、血量60888亿、所有武功提升 480000层") + "<br>" + LanResManager.getLanCommonTextWords("特殊属性：激活该秘籍后，可使用通天石进行养成属性，每次可增加攻击100亿，") + "<br>" + LanResManager.getLanCommonTextWords("所有武功提升20000层！（最多可养成500次！）") + "<br>" + LanResManager.getLanCommonTextWords("已养成") + tongtianshi + LanResManager.getLanCommonTextWords("次") + "<br>" + LanResManager.getLanCommonTextWords("增加攻击") + tongtianshi * 100 + LanResManager.getLanCommonTextWords("亿  提升武功") + tongtianshi * 20000 + LanResManager.getLanCommonTextWords("层");
            return _loc1_ + "</textformat>";
         });
         this.fts2 = new FTextArea();
         this.fts2.x = 228;
         this.fts2.y = 7 + 20 + 20;
         this.fts2.textColor = StaticValue.GREEN;
         this.fts2.width = 170 + 20;
         this.fts2.height = 20;
         this.fts2.htmlText = LanResManager.getLanCommonTextWords("傲剑战力隐藏属性(已激活)");
         this.fts2.visible = false;
         addChild(this.fts2);
         ToolTips.createToolTips(this.fts2,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>";
            if(zhanli)
            {
               _loc1_ += LanResManager.getLanCommonTextWords("已使用傲剑战力石") + zhanli + LanResManager.getLanCommonTextWords("颗") + "," + LanResManager.getLanCommonTextWords("增加人物战斗力") + zhanli * 200 + LanResManager.getLanCommonTextWords("亿") + "<br>";
            }
            if(shendun)
            {
               _loc1_ += LanResManager.getLanCommonTextWords("已使用神盾石") + shendun + LanResManager.getLanCommonTextWords("颗") + "," + LanResManager.getLanCommonTextWords("增加人物防御") + shendun * 100 + LanResManager.getLanCommonTextWords("亿") + "<br>";
            }
            if(qiangzhe)
            {
               _loc1_ += LanResManager.getLanCommonTextWords("已使用强者石") + qiangzhe + LanResManager.getLanCommonTextWords("颗") + "," + LanResManager.getLanCommonTextWords("增加人物攻击") + qiangzhe * 100 + LanResManager.getLanCommonTextWords("亿") + "<br>";
            }
            if(kuangbao)
            {
               _loc1_ += LanResManager.getLanCommonTextWords("已使用狂暴石") + kuangbao + LanResManager.getLanCommonTextWords("颗") + "," + LanResManager.getLanCommonTextWords("增加人物暴击") + kuangbao * 50 + LanResManager.getLanCommonTextWords("亿") + "<br>";
            }
            if(shunying)
            {
               _loc1_ += LanResManager.getLanCommonTextWords("已使用瞬影石") + shunying + LanResManager.getLanCommonTextWords("颗") + "," + LanResManager.getLanCommonTextWords("增加人物闪避") + shunying * 50 + LanResManager.getLanCommonTextWords("亿") + "<br>";
            }
            if(qiangsheng)
            {
               _loc1_ += LanResManager.getLanCommonTextWords("已使用强生石") + qiangsheng + LanResManager.getLanCommonTextWords("颗") + "," + LanResManager.getLanCommonTextWords("增加人物生命") + qiangsheng * 100 + LanResManager.getLanCommonTextWords("亿") + "<br>";
            }
            return _loc1_ + "</textformat>";
         });
         this.fts3 = new FTextArea();
         this.fts3.x = 10;
         this.fts3.y = 10 + 20;
         this.fts3.textColor = StaticValue.GREEN;
         this.fts3.autoSize = TextFieldAutoSize.LEFT;
         this.fts3.htmlText = LanResManager.getLanCommonTextWords("皇城守卫秘籍（已激活）");
         this.fts3.visible = false;
         addChild(this.fts3);
         ToolTips.createToolTips(this.fts3,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("勾选换装可穿上皇城守卫套装") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.check = new FCheckBox();
         addChild(this.check);
         this.check.x = 10;
         this.check.y = 50;
         this.check.addEventListener(MouseEvent.CLICK,this.onCheckClick);
         this.checkLabel = new FLabel();
         with(this.checkLabel)
         {
            x = check.x + 20;
            --check.y;
            textColor = StaticValue.GREEN;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("自动换装");
         }
         addChild(this.checkLabel);
         this.fts4 = new FTextArea();
         this.fts4.x = 228;
         this.fts4.y = 7 + 20 + 20 + 20;
         this.fts4.width = 120;
         this.fts4.height = 20;
         this.fts4.textColor = StaticValue.GREEN;
         this.fts4.autoSize = TextFieldAutoSize.LEFT;
         this.fts4.htmlText = LanResManager.getLanCommonTextWords("红莲秘籍（已激活）");
         this.fts4.visible = false;
         addChild(this.fts4);
         ToolTips.createToolTips(this.fts4,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("特殊属性：攻击88888亿、防御60888亿、血量80888亿、攻速 188 、所有武功提升 880000层") + "<br>" + LanResManager.getLanCommonTextWords("红莲—— 传闻于天界神匠经过百年锻造而成，仙魔大战后，该神器就被遗落人间。攻击时") + "<br>" + LanResManager.getLanCommonTextWords("有几率触发红莲，持续10秒；自身将进入红莲仙人模式，每次移动或者跳跃都将超越凡") + "<br>" + LanResManager.getLanCommonTextWords("人，使自身进入幻影状态，在幻影状态下对手将无法锁定到自身；且自身在幻影状态下，") + "<br>" + LanResManager.getLanCommonTextWords("每次攻击对手，都将附带仙技效果，使对手所有勋章失效，立即定身于原地，持续10秒！") + " </font>";
            return _loc1_ + "</textformat>";
         });
         this.fts5 = new FTextArea();
         this.fts5.x = 228;
         this.fts5.y = 7 + 20 + 20 + 20 + 20;
         this.fts5.width = 120;
         this.fts5.height = 20;
         this.fts5.textColor = StaticValue.GREEN;
         this.fts5.autoSize = TextFieldAutoSize.LEFT;
         this.fts5.htmlText = LanResManager.getLanCommonTextWords("王者强化石（已激活）");
         this.fts5.visible = false;
         addChild(this.fts5);
         ToolTips.createToolTips(this.fts5,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("提升人物攻击10000亿 、防御 10000亿 提升武功提升20000层") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.fts6 = new FTextArea();
         this.fts6.x = 228;
         this.fts6.y = 7 + 20 + 20 + 20 + 20 + 20;
         this.fts6.width = 120;
         this.fts6.height = 20;
         this.fts6.textColor = StaticValue.GREEN;
         this.fts6.autoSize = TextFieldAutoSize.LEFT;
         this.fts6.htmlText = LanResManager.getLanCommonTextWords("原始真解（已激活）");
         this.fts6.visible = false;
         addChild(this.fts6);
         ToolTips.createToolTips(this.fts6,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("特殊属性：攻击：56888亿、防御52888亿、血量60888亿、所有武功提升 500000层") + "<br>" + "</font><font color=\'" + (xiongshouCount >= 3 ? StaticValue.GREEN_HTML : StaticValue.WHITE_HTML) + "\'>" + LanResManager.getLanCommonTextWords("原始一重：") + "<br>" + LanResManager.getLanCommonTextWords("当拥有3只上古凶兽时，可激活原始一重。攻击时100%触发原始一重凶兽怒吼，持续10秒。") + "<br>" + LanResManager.getLanCommonTextWords("每次攻击都可将对手击退至百里之外，且每次受到攻击的对手，都将无力反击，持续10秒。") + "<br>" + LanResManager.getLanCommonTextWords("直接凶兽息怒为止。冷却60秒。") + "<br>" + "</font><font color=\'" + (xiongshouCount >= 6 ? StaticValue.GREEN_HTML : StaticValue.WHITE_HTML) + "\'>" + LanResManager.getLanCommonTextWords("原始二重：") + "<br>" + LanResManager.getLanCommonTextWords("当拥有6只上古凶兽时，可激活原始二重。攻击时100%触发原始二重凶兽护盾，持续10秒；") + "<br>" + LanResManager.getLanCommonTextWords("自身在此状态下，所有对手技能、攻击、暗器、出战、侍从等技能都将无法命中自身。冷") + "<br>" + LanResManager.getLanCommonTextWords("却60秒。") + "<br>" + "</font><font color=\'" + (xiongshouCount >= 10 ? StaticValue
            .GREEN_HTML : StaticValue.WHITE_HTML) + "\'>" + LanResManager.getLanCommonTextWords("原始三重：") + "<br>" + LanResManager.getLanCommonTextWords("当拥有10只上古凶兽时，可激活原始三重。攻击时100%触发原始三重天昏地暗，持续10秒；") + "<br>" + LanResManager.getLanCommonTextWords("对手在黑暗中，将无法触发所有勋章效果；且在黑暗中，只要对手移动都将受到黑暗的侵") + "<br>" + LanResManager.getLanCommonTextWords("蚀，持续掉血60%；当黑暗结束后，对手将进入恶梦之中，持续30秒。冷却60秒。");
            return _loc1_ + "</font></textformat>";
         });
         this.fts7 = new FTextArea();
         this.fts7.x = 190;
         this.fts7.y = 190 + 37;
         this.fts7.textColor = StaticValue.GREEN;
         this.fts7.width = 110;
         this.fts7.height = 20;
         this.fts7.htmlText = LanResManager.getLanCommonTextWords("轩辕神剑");
         this.fts7.visible = false;
         addChild(this.fts7);
         this.check1 = new FCheckBox();
         this.check1.x = 190 + 80 - 20;
         this.check1.y = 190 + 37;
         this.check1.addEventListener(MouseEvent.CLICK,this.onCheckClick);
      }
      
      private function onCheckClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.check:
               this._parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.check.selectState,7]));
               break;
            case this.check1:
               this._parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.check1.selectState,58]));
         }
      }
      
      private function onItemClick(param1:MouseEvent) : void
      {
         if(!this.isLockOn)
         {
            this._parent.dispatchEvent(new BaseEvent(CharAttribute.UI_CHAR_ATTRIBUTE_MENU_SHOW,"",param1));
         }
      }
      
      private function aa1(param1:BaseEvent) : void
      {
         this.onShowLv(false);
      }
      
      public function set setParent(param1:DisplayObject) : void
      {
         this._parent = param1;
         this.jingjietupoCanvas.$parent = param1;
         this.jingjietupoCanvas.$parent2 = this;
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.btn1:
               this._parent.dispatchEvent(new BaseEvent(CharAttribute.UI_JINGJIE_EVENT_CLICK,"",1));
               break;
            case this.btn2:
               this._parent.dispatchEvent(new BaseEvent(CharAttribute.UI_JINGJIE_EVENT_CLICK,"",2));
               break;
            case this.btn3:
               this._parent.dispatchEvent(new BaseEvent(CharAttribute.UI_JINGJIE_EVENT_CLICK,"",3));
               break;
            case this.btn4:
               this._parent.dispatchEvent(new BaseEvent(CharAttribute.UI_JINGJIE_EVENT_CLICK,"",4));
               break;
            case this.btn5:
               this._parent.dispatchEvent(new BaseEvent(CharAttribute.UI_JINGJIE_EVENT_CLICK,"",5));
               break;
            case this.btn6:
               this._parent.dispatchEvent(new BaseEvent(CharAttribute.UI_JINGJIE_EVENT_CLICK,"",6));
               break;
            case this.btn7:
               this._parent.dispatchEvent(new BaseEvent(CharAttribute.UI_JINGJIE_EVENT_CLICK,"",7));
               break;
            case this.btn8:
               this._parent.dispatchEvent(new BaseEvent(CharAttribute.UI_JINGJIE_EVENT_CLICK,"",8));
               break;
            case this.btn9:
               this._parent.dispatchEvent(new BaseEvent(CharAttribute.UI_JINGJIE_EVENT_CLICK,"",9));
               break;
            case this.btn10:
               this._parent.dispatchEvent(new BaseEvent(CharAttribute.UI_JINGJIE_EVENT_CLICK,"",10));
               break;
            case this.lingWuBtn:
               this._parent.dispatchEvent(new BaseEvent(CharAttribute.JINGJIE_LINGWU_SHOW));
               break;
            case this.shuoMingBtn:
               this.tianJia();
         }
      }
      
      private function tianJia() : void
      {
         if(!this.shuomingPanel)
         {
            this.shuomingPanel = new JingJieshuoming();
         }
         GameInstance.uiInstance.uiContainer.addChild(this.shuomingPanel);
         this.shuomingPanel.visible = true;
         this.shuomingPanel.x = (GameConfig.sceneWidth - this.shuomingPanel.width) / 2;
         this.shuomingPanel.y = (GameConfig.sceneHeight - this.shuomingPanel.height) / 2;
      }
      
      private function onMouseTip1(param1:MouseEvent) : void
      {
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               this.btn1.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTip1);
               break;
            case MouseEvent.MOUSE_MOVE:
               this.showTip(this.toolTipStr1);
               break;
            case MouseEvent.MOUSE_OUT:
               if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
               this.btn1.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTip1);
         }
      }
      
      private function onMouseTip2(param1:MouseEvent) : void
      {
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               this.btn2.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTip2);
               break;
            case MouseEvent.MOUSE_MOVE:
               this.showTip(this.toolTipStr2);
               break;
            case MouseEvent.MOUSE_OUT:
               if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
               this.btn2.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTip2);
         }
      }
      
      private function onMouseTip3(param1:MouseEvent) : void
      {
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               this.btn3.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTip3);
               break;
            case MouseEvent.MOUSE_MOVE:
               this.showTip(this.toolTipStr3);
               break;
            case MouseEvent.MOUSE_OUT:
               if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
               this.btn3.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTip3);
         }
      }
      
      private function onMouseTip4(param1:MouseEvent) : void
      {
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               this.btn4.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTip4);
               break;
            case MouseEvent.MOUSE_MOVE:
               this.showTip(this.toolTipStr4);
               break;
            case MouseEvent.MOUSE_OUT:
               if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
               this.btn4.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTip4);
         }
      }
      
      private function onMouseTip5(param1:MouseEvent) : void
      {
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               this.btn5.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTip5);
               break;
            case MouseEvent.MOUSE_MOVE:
               this.showTip(this.toolTipStr5);
               break;
            case MouseEvent.MOUSE_OUT:
               if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
               this.btn5.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTip5);
         }
      }
      
      private function onMouseTip6(param1:MouseEvent) : void
      {
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               this.btn6.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTip6);
               break;
            case MouseEvent.MOUSE_MOVE:
               this.showTip(this.toolTipStr6);
               break;
            case MouseEvent.MOUSE_OUT:
               if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
               this.btn6.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTip6);
         }
      }
      
      private function onMouseTip7(param1:MouseEvent) : void
      {
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               this.btn7.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTip7);
               break;
            case MouseEvent.MOUSE_MOVE:
               this.showTip(this.toolTipStr7);
               break;
            case MouseEvent.MOUSE_OUT:
               if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
               this.btn7.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTip7);
         }
      }
      
      private function onMouseTip8(param1:MouseEvent) : void
      {
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               this.btn8.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTip8);
               break;
            case MouseEvent.MOUSE_MOVE:
               this.showTip(this.toolTipStr8);
               break;
            case MouseEvent.MOUSE_OUT:
               if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
               this.btn8.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTip8);
         }
      }
      
      private function onMouseTip9(param1:MouseEvent) : void
      {
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               this.btn9.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTip9);
               break;
            case MouseEvent.MOUSE_MOVE:
               this.showTip(this.toolTipStr9);
               break;
            case MouseEvent.MOUSE_OUT:
               if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
               this.btn9.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTip9);
         }
      }
      
      private function onMouseTip10(param1:MouseEvent) : void
      {
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               this.btn10.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTip10);
               break;
            case MouseEvent.MOUSE_MOVE:
               this.showTip(this.toolTipStr10);
               break;
            case MouseEvent.MOUSE_OUT:
               if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
               this.btn10.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTip10);
         }
      }
      
      private function showTip(param1:String) : void
      {
         this.tip.htmlText = param1;
         addChild(this.tipCanvas);
         this.tipCanvas.width = this.tip.width + 4;
         this.tipCanvas.height = this.tip.height + 4;
         this.tipCanvas.x = mouseX + 15;
         this.tipCanvas.y = mouseY + 25;
      }
      
      public function setInitialize(param1:int, param2:int, param3:int, param4:Boolean) : void
      {
         while(this.anniuContainer.numChildren > 0)
         {
            this.anniuContainer.removeChildAt(0);
         }
         var _loc5_:* = 10;
         while(_loc5_ > 0)
         {
            if(param1 >= _loc5_)
            {
               if(param2 <= _loc5_)
               {
                  this.$class = getDefinitionByName("ui.char.jingjie.btn.b") as Class;
                  this["btn" + _loc5_] = new this.$class() as SimpleButton;
               }
               else
               {
                  this.$class = getDefinitionByName("ui.char.jingjie.btn.a") as Class;
                  this["btn" + _loc5_] = new this.$class() as SimpleButton;
               }
            }
            else
            {
               this.$class = getDefinitionByName("ui.char.jingjie.btn.c") as Class;
               this["btn" + _loc5_] = new this.$class() as SimpleButton;
            }
            this.anniuContainer.addChild(this["btn" + _loc5_]);
            this["btn" + _loc5_].addEventListener(MouseEvent.CLICK,this.onClick);
            this["btn" + _loc5_].addEventListener(MouseEvent.MOUSE_OVER,this["onMouseTip" + _loc5_]);
            this["btn" + _loc5_].addEventListener(MouseEvent.MOUSE_OUT,this["onMouseTip" + _loc5_]);
            _loc5_--;
         }
         this.btn1.x = 115;
         this.btn1.y = 305;
         this.btn2.x = 35;
         this.btn2.y = 270;
         this.btn3.x = 100;
         this.btn3.y = 225;
         this.btn4.x = 28;
         this.btn4.y = 195;
         this.btn5.x = 110;
         this.btn5.y = 165;
         this.btn6.x = 63;
         this.btn6.y = 135;
         this.btn7.x = 115;
         this.btn7.y = 102;
         this.btn8.x = 33;
         this.btn8.y = 78;
         this.btn9.x = 65;
         this.btn9.y = 46;
         this.btn10.x = 76;
         this.btn10.y = 2;
         if(this.gongImg != null && this.gongImg.parent != null)
         {
            removeChild(this.gongImg);
         }
         if(param3 == 0)
         {
            if(this.gongImgObj[1] != null)
            {
               this.gongImg = this.gongImgObj[1];
            }
            else
            {
               this.gongImg = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/jingjie/" + 1 + ".png",201,237);
               this.gongImgObj[1] = this.gongImg;
            }
         }
         else if(this.gongImgObj[param3] != null)
         {
            this.gongImg = this.gongImgObj[param3];
         }
         else
         {
            this.gongImg = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/jingjie/" + param3 + ".png",201,237);
            this.gongImgObj[param3] = this.gongImg;
         }
         this.gongImg.x = 205;
         this.gongImg.y = 10;
         addChildAt(this.gongImg,5);
         if(param1 >= param2 && param1 >= param3 || param2 - param1 == 1 && param1 >= param3)
         {
            if(param2 > param3)
            {
               this.lingWuBtn.label = LanResManager.getLanCommonTextWords("已领悟");
               this.lingWuBtn.enabled = false;
            }
            else if(param2 == param3)
            {
               this.lingWuBtn.label = LanResManager.getLanCommonTextWords("开始领悟");
               this.lingWuBtn.enabled = true;
            }
            else
            {
               this.lingWuBtn.label = LanResManager.getLanCommonTextWords("开始领悟");
               this.lingWuBtn.enabled = false;
            }
         }
         else
         {
            this.lingWuBtn.label = LanResManager.getLanCommonTextWords("未领悟");
            this.lingWuBtn.enabled = false;
         }
         this.setJiHuo(param4);
      }
      
      public function setJiHuo(param1:Boolean) : void
      {
         this.xiongshouCount = 0;
         if(param1)
         {
            this.fts1.visible = GameState.dictMainStatus[SpecialGoodsID.JINGJIE_NEIGONGXINFA_ID];
            this.tongtianshi = GameState.dictMainStatus[SpecialGoodsID.JINGJIE_CHANGSHENGSHI_ID];
            this.zhanli = GameState.dictMainStatus[SpecialGoodsID.JINGJIE_ZHANLISHI_ID];
            this.qiangzhe = GameState.dictMainStatus[SpecialGoodsID.JINGJIE_QIANGZHESHI_ID];
            this.kuangbao = GameState.dictMainStatus[SpecialGoodsID.JINGJIE_KUANGBAOSHI_ID];
            this.shendun = GameState.dictMainStatus[SpecialGoodsID.JINGJIE_SHENDUNSHI_ID];
            this.shunying = GameState.dictMainStatus[SpecialGoodsID.JINGJIE_SHUNYINGSHI_ID];
            this.qiangsheng = GameState.dictMainStatus[SpecialGoodsID.JINGJIE_QIANGSHENGSHI_ID];
            if(Boolean(this.zhanli) || Boolean(this.qiangzhe) || Boolean(this.shendun) || Boolean(this.kuangbao) || Boolean(this.shunying) || Boolean(this.qiangsheng))
            {
               this.fts2.visible = true;
            }
            else
            {
               this.fts2.visible = false;
            }
            this.fts3.visible = GameState.dictMainStatus[SpecialGoodsID.JINGJIE_HUANGCHENGSHOUWEI_ID];
            this.check.visible = GameState.dictMainStatus[SpecialGoodsID.JINGJIE_HUANGCHENGSHOUWEI_ID];
            this.checkLabel.visible = GameState.dictMainStatus[SpecialGoodsID.JINGJIE_HUANGCHENGSHOUWEI_ID];
            this.fts4.visible = GameState.dictMainStatus[SpecialGoodsID.JINGJIE_HONGLIANMIJI_ID];
            this.fts5.visible = GameState.dictMainStatus[SpecialGoodsID.JINGJIE_WANGZHEQIANGHUASHI_ID];
            this.fts6.visible = GameState.dictMainStatus[SpecialGoodsID.JINGJIE_YUANSHIZHENJIE_ID];
            this.xiongshouBg0.visible = GameState.dictMainStatus[SpecialGoodsID.JINGJIE_XIONGSHOU1_ID];
            this.xiongshouBg1.visible = GameState.dictMainStatus[SpecialGoodsID.JINGJIE_XIONGSHOU2_ID];
            this.xiongshouBg2.visible = GameState.dictMainStatus[SpecialGoodsID.JINGJIE_XIONGSHOU3_ID];
            this.xiongshouBg3.visible = GameState.dictMainStatus[SpecialGoodsID.JINGJIE_XIONGSHOU4_ID];
            this.xiongshouBg4.visible = GameState.dictMainStatus[SpecialGoodsID.JINGJIE_XIONGSHOU5_ID];
            this.xiongshouBg5.visible = GameState.dictMainStatus[SpecialGoodsID.JINGJIE_XIONGSHOU6_ID];
            this.xiongshouBg6.visible = GameState.dictMainStatus[SpecialGoodsID.JINGJIE_XIONGSHOU7_ID];
            this.xiongshouBg7.visible = GameState.dictMainStatus[SpecialGoodsID.JINGJIE_XIONGSHOU8_ID];
            this.xiongshouBg8.visible = GameState.dictMainStatus[SpecialGoodsID.JINGJIE_XIONGSHOU9_ID];
            this.xiongshouBg9.visible = GameState.dictMainStatus[SpecialGoodsID.JINGJIE_XIONGSHOU10_ID];
            if(GameState.dictMainStatus[SpecialGoodsID.JINGJIE_XIONGSHOU1_ID])
            {
               this.xiongshouCount += 1;
            }
            if(GameState.dictMainStatus[SpecialGoodsID.JINGJIE_XIONGSHOU2_ID])
            {
               this.xiongshouCount += 1;
            }
            if(GameState.dictMainStatus[SpecialGoodsID.JINGJIE_XIONGSHOU3_ID])
            {
               this.xiongshouCount += 1;
            }
            if(GameState.dictMainStatus[SpecialGoodsID.JINGJIE_XIONGSHOU4_ID])
            {
               this.xiongshouCount += 1;
            }
            if(GameState.dictMainStatus[SpecialGoodsID.JINGJIE_XIONGSHOU5_ID])
            {
               this.xiongshouCount += 1;
            }
            if(GameState.dictMainStatus[SpecialGoodsID.JINGJIE_XIONGSHOU6_ID])
            {
               this.xiongshouCount += 1;
            }
            if(GameState.dictMainStatus[SpecialGoodsID.JINGJIE_XIONGSHOU7_ID])
            {
               this.xiongshouCount += 1;
            }
            if(GameState.dictMainStatus[SpecialGoodsID.JINGJIE_XIONGSHOU8_ID])
            {
               this.xiongshouCount += 1;
            }
            if(GameState.dictMainStatus[SpecialGoodsID.JINGJIE_XIONGSHOU9_ID])
            {
               this.xiongshouCount += 1;
            }
            if(GameState.dictMainStatus[SpecialGoodsID.JINGJIE_XIONGSHOU10_ID])
            {
               this.xiongshouCount += 1;
            }
         }
         else
         {
            this.fts1.visible = GameState.dictTargetStatus[SpecialGoodsID.JINGJIE_NEIGONGXINFA_ID];
            this.tongtianshi = GameState.dictTargetStatus[SpecialGoodsID.JINGJIE_CHANGSHENGSHI_ID];
            this.zhanli = GameState.dictTargetStatus[SpecialGoodsID.JINGJIE_ZHANLISHI_ID];
            this.qiangzhe = GameState.dictTargetStatus[SpecialGoodsID.JINGJIE_QIANGZHESHI_ID];
            this.kuangbao = GameState.dictTargetStatus[SpecialGoodsID.JINGJIE_KUANGBAOSHI_ID];
            this.shendun = GameState.dictTargetStatus[SpecialGoodsID.JINGJIE_SHENDUNSHI_ID];
            this.shunying = GameState.dictTargetStatus[SpecialGoodsID.JINGJIE_SHUNYINGSHI_ID];
            this.qiangsheng = GameState.dictTargetStatus[SpecialGoodsID.JINGJIE_QIANGSHENGSHI_ID];
            if(Boolean(this.zhanli) || Boolean(this.qiangzhe) || Boolean(this.shendun) || Boolean(this.kuangbao) || Boolean(this.shunying) || Boolean(this.qiangsheng))
            {
               this.fts2.visible = true;
            }
            else
            {
               this.fts2.visible = false;
            }
            this.fts3.visible = GameState.dictTargetStatus[SpecialGoodsID.JINGJIE_HUANGCHENGSHOUWEI_ID];
            this.check.visible = GameState.dictTargetStatus[SpecialGoodsID.JINGJIE_HUANGCHENGSHOUWEI_ID];
            this.checkLabel.visible = GameState.dictTargetStatus[SpecialGoodsID.JINGJIE_HUANGCHENGSHOUWEI_ID];
            this.fts4.visible = GameState.dictTargetStatus[SpecialGoodsID.JINGJIE_HONGLIANMIJI_ID];
            this.fts5.visible = GameState.dictTargetStatus[SpecialGoodsID.JINGJIE_WANGZHEQIANGHUASHI_ID];
            this.fts6.visible = GameState.dictTargetStatus[SpecialGoodsID.JINGJIE_YUANSHIZHENJIE_ID];
            this.xiongshouBg0.visible = GameState.dictTargetStatus[SpecialGoodsID.JINGJIE_XIONGSHOU1_ID];
            this.xiongshouBg1.visible = GameState.dictTargetStatus[SpecialGoodsID.JINGJIE_XIONGSHOU2_ID];
            this.xiongshouBg2.visible = GameState.dictTargetStatus[SpecialGoodsID.JINGJIE_XIONGSHOU3_ID];
            this.xiongshouBg3.visible = GameState.dictTargetStatus[SpecialGoodsID.JINGJIE_XIONGSHOU4_ID];
            this.xiongshouBg4.visible = GameState.dictTargetStatus[SpecialGoodsID.JINGJIE_XIONGSHOU5_ID];
            this.xiongshouBg5.visible = GameState.dictTargetStatus[SpecialGoodsID.JINGJIE_XIONGSHOU6_ID];
            this.xiongshouBg6.visible = GameState.dictTargetStatus[SpecialGoodsID.JINGJIE_XIONGSHOU7_ID];
            this.xiongshouBg7.visible = GameState.dictTargetStatus[SpecialGoodsID.JINGJIE_XIONGSHOU8_ID];
            this.xiongshouBg8.visible = GameState.dictTargetStatus[SpecialGoodsID.JINGJIE_XIONGSHOU9_ID];
            this.xiongshouBg9.visible = GameState.dictTargetStatus[SpecialGoodsID.JINGJIE_XIONGSHOU10_ID];
            if(GameState.dictTargetStatus[SpecialGoodsID.JINGJIE_XIONGSHOU1_ID])
            {
               this.xiongshouCount += 1;
            }
            if(GameState.dictTargetStatus[SpecialGoodsID.JINGJIE_XIONGSHOU2_ID])
            {
               this.xiongshouCount += 1;
            }
            if(GameState.dictTargetStatus[SpecialGoodsID.JINGJIE_XIONGSHOU3_ID])
            {
               this.xiongshouCount += 1;
            }
            if(GameState.dictTargetStatus[SpecialGoodsID.JINGJIE_XIONGSHOU4_ID])
            {
               this.xiongshouCount += 1;
            }
            if(GameState.dictTargetStatus[SpecialGoodsID.JINGJIE_XIONGSHOU5_ID])
            {
               this.xiongshouCount += 1;
            }
            if(GameState.dictTargetStatus[SpecialGoodsID.JINGJIE_XIONGSHOU6_ID])
            {
               this.xiongshouCount += 1;
            }
            if(GameState.dictTargetStatus[SpecialGoodsID.JINGJIE_XIONGSHOU7_ID])
            {
               this.xiongshouCount += 1;
            }
            if(GameState.dictTargetStatus[SpecialGoodsID.JINGJIE_XIONGSHOU8_ID])
            {
               this.xiongshouCount += 1;
            }
            if(GameState.dictTargetStatus[SpecialGoodsID.JINGJIE_XIONGSHOU9_ID])
            {
               this.xiongshouCount += 1;
            }
            if(GameState.dictTargetStatus[SpecialGoodsID.JINGJIE_XIONGSHOU10_ID])
            {
               this.xiongshouCount += 1;
            }
         }
      }
      
      public function setShuxing(param1:Boolean, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int, param8:int, param9:int) : void
      {
         var _loc10_:String = "";
         var _loc11_:String = "";
         _loc10_ += "<textformat leading=\'1\'><font color=\'" + StaticValue.SKY_BLUE_HTML + "\'>";
         if(param1)
         {
            _loc10_ += LanResManager.getLanCommonTextWords("攻击：") + "+" + param2 + " X 2" + "<br>" + LanResManager.getLanCommonTextWords("防御：") + "+" + param3 + " X 2" + "<br>" + LanResManager.getLanCommonTextWords("生命：") + "+" + param4 + " X 2" + "<br>" + LanResManager.getLanCommonTextWords("内力：") + "+" + param5 + " X 2" + "<br>" + LanResManager.getLanCommonTextWords("体力：") + "+" + param6 + " X 2" + "<br>";
         }
         else
         {
            _loc10_ += LanResManager.getLanCommonTextWords("攻击：") + "+" + param2 + "<br>" + LanResManager.getLanCommonTextWords("防御：") + "+" + param3 + "<br>" + LanResManager.getLanCommonTextWords("生命：") + "+" + param4 + "<br>" + LanResManager.getLanCommonTextWords("内力：") + "+" + param5 + "<br>" + LanResManager.getLanCommonTextWords("体力：") + "+" + param6 + "<br>";
         }
         _loc10_ += "</font>";
         _loc10_ = _loc10_ + "</textformat>";
         this.fta1.htmlText = _loc10_;
         _loc11_ += "<textformat leading=\'1\'><font color=\'" + StaticValue.SKY_BLUE_HTML + "\'>";
         if(param7 != 0)
         {
            _loc11_ += LanResManager.getLanCommonTextWords("门派绝学：") + "+" + param7 + LanResManager.getLanCommonTextWords("层") + "<br>";
         }
         if(param8 != 0)
         {
            _loc11_ += LanResManager.getLanCommonTextWords("江湖绝学：") + "+" + param8 + LanResManager.getLanCommonTextWords("层") + "<br>";
         }
         if(param9 != 0)
         {
            _loc11_ += LanResManager.getLanCommonTextWords("其他绝学：") + "+" + param9 + LanResManager.getLanCommonTextWords("层") + "<br>";
         }
         _loc11_ += "</font>";
         _loc11_ = _loc11_ + "</textformat>";
         this.fta2.htmlText = _loc11_;
      }
      
      public function onShowLv(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.jingjietupoCanvas.y == 380)
            {
               TweenMax.to(this.jingjietupoCanvas,1,{"y":266});
               this.lingWuBtn.enabled = false;
            }
         }
         else if(this.jingjietupoCanvas.y == 266)
         {
            TweenMax.to(this.jingjietupoCanvas,1,{"y":380});
            this.lingWuBtn.enabled = true;
            this._parent.dispatchEvent(new BaseEvent(CharAttribute.UI_JINGJIE_ZIDONGTISHENG_CLICK,"",false));
         }
      }
      
      public function menuToolTip(param1:Array) : void
      {
         this.toolTipStr1 = param1[0];
         this.toolTipStr2 = param1[1];
         this.toolTipStr3 = param1[2];
         this.toolTipStr4 = param1[3];
         this.toolTipStr5 = param1[4];
         this.toolTipStr6 = param1[5];
         this.toolTipStr7 = param1[6];
         this.toolTipStr8 = param1[7];
         this.toolTipStr9 = param1[8];
         this.toolTipStr10 = param1[9];
      }
      
      public function setTuPoZhufuzhi(param1:int, param2:int) : void
      {
         this.jingjietupoCanvas.setZhufuzhi(param1,param2);
      }
      
      public function setTuPoShuxing(param1:int, param2:int, param3:String) : void
      {
         this.jingjietupoCanvas.setShuxing(param1,param2,param3);
      }
      
      public function setTuPoGoods(param1:Goods) : void
      {
         this.jingjietupoCanvas.setGoods(param1);
      }
      
      public function setTuPoBtn(param1:Boolean) : void
      {
         this.jingjietupoCanvas.setBtn(param1);
      }
      
      public function setJingJieEnabledFun() : void
      {
         this.lingWuBtn.enabled = false;
         this.lingWuBtn.label = LanResManager.getLanCommonTextWords("开始领悟");
         var _loc1_:int = 1;
         while(_loc1_ <= 10)
         {
            this["btn" + _loc1_].removeEventListener(MouseEvent.MOUSE_OVER,this["onMouseTip" + _loc1_]);
            this["btn" + _loc1_].removeEventListener(MouseEvent.MOUSE_OUT,this["onMouseTip" + _loc1_]);
            this["btn" + _loc1_].enabled = false;
            _loc1_++;
         }
         this.isLockOn = true;
      }
      
      public function removeShuoming() : void
      {
         if(this.shuomingPanel != null && this.shuomingPanel.parent != null)
         {
            this.shuomingPanel.parent.removeChild(this.shuomingPanel);
         }
      }
      
      public function set_CJTBS(param1:Array) : void
      {
         var _loc3_:Goods = null;
         var _loc4_:ItemFace = null;
         while(this.equipContainer.numChildren > 0)
         {
            this.equipContainer.removeChildAt(0);
         }
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            _loc3_ = param1[_loc2_] as Goods;
            _loc4_ = new ItemFace(_loc3_);
            if(_loc3_.res.position == ItemPositionRange.POSTION_CHAOFANTUOSU)
            {
               _loc4_.x = 4 + 1;
               _loc4_.y = 4 + 1;
               this.equipContainer.addChild(_loc4_);
            }
            else if(_loc3_.res.position == ItemPositionRange.POSTION_NIEPANCHONGSHENG)
            {
               _loc4_.x = 40 + 5;
               _loc4_.y = 4 + 1;
               this.equipContainer.addChild(_loc4_);
            }
            else if(_loc3_.res.position == ItemPositionRange.POSTION_JINGJIE_XUANYUANSHENJIAN)
            {
               _loc4_.x = 40 + 1 - 105 - 40 + 95 - 15;
               _loc4_.y = 4 + 1 - 105 + 10;
               this.equipContainer.addChild(_loc4_);
               if(_loc4_ != null)
               {
                  this.fts7.visible = true;
                  this.check1.visible = true;
               }
               else
               {
                  this.fts7.visible = false;
                  this.check1.visible = false;
               }
            }
            _loc2_++;
         }
      }
      
      public function set_LYGG(param1:Boolean, param2:Skill) : void
      {
         var _loc3_:Bitmap = null;
         var _loc4_:ItemFace = null;
         while(this.lyggSkillContainer.numChildren > 0)
         {
            this.lyggSkillContainer.removeChildAt(0);
         }
         if(param1)
         {
            _loc3_ = StaticValue.getBitmapByClassName("ui.char.xunzhang.kuang");
            this.lyggSkillContainer.addChild(_loc3_);
            _loc4_ = new ItemFace(param2);
            _loc4_.x = 3;
            _loc4_.y = 3;
            _loc4_.setShowCount(false);
            this.lyggSkillContainer.addChild(_loc4_);
         }
      }
      
      public function setWeilieShuxing(param1:Boolean) : void
      {
         if(param1)
         {
            this.fts.visible = true;
         }
         else
         {
            this.fts.visible = false;
         }
      }
      
      public function setChuandai(param1:Boolean, param2:Boolean) : void
      {
         this.check.selectState = param1;
         this.check1.selectState = param2;
      }
   }
}

