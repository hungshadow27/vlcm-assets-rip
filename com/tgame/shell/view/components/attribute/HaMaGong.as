package com.tgame.shell.view.components.attribute
{
   import com.fireice.button.FSimpleButton;
   import com.fireice.checkBox.FCheckBox;
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameState;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.common.utils.ToolTips;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.common.vo.item.Skill;
   import com.tgame.moudels.hamagong.info.HaMaGongVO;
   import com.tgame.shell.view.components.CharAttribute;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.text.*;
   import gs.TweenMax;
   
   public class HaMaGong extends Sprite
   {
      
      public static const UI_HAMAGONGTUPO_GUANBI_CLICK:String = "UI_HAMAGONGTUPO_GUANBI_CLICK";
      
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
      
      private var haMaGongTupoCanvas:HaMaGongTupoCanvas;
      
      private var nowLevel:int;
      
      private var loadUrl:String;
      
      private var tipsMs:String = "";
      
      private var Song_bit:DisplayObject;
      
      private var vo:HaMaGongVO;
      
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
      
      private var lookingId:int;
      
      private var bg:DisplayObject;
      
      private var fts:FTextArea;
      
      private var fts2:FTextArea;
      
      private var fts3:FTextArea;
      
      public var check:FCheckBox;
      
      private var checkLabel:FLabel;
      
      private var fts4:FTextArea;
      
      private var kuang:Bitmap;
      
      private var mainSkillItemFace1:ItemFace;
      
      private var mainSkillContainer1:Sprite;
      
      public function HaMaGong()
      {
         var $mask:Sprite;
         this.arr = [];
         this.mcObj = {};
         super();
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
         this.fc.height = 242;
         this.fc.skin = "box_transparence";
         this.fc = new FCanvas();
         this.fc.x = 3;
         this.fc.y = 244;
         this.fc.width = 400;
         this.fc.height = 121;
         this.fc.skin = "box_transparence";
         addChild(this.fc);
         this.previousButton = new FSimpleButton();
         this.previousButton.skin = "previousButton";
         addChild(this.previousButton);
         this.previousButton.x = 120;
         this.previousButton.y = 220;
         this.previousButton.addEventListener(MouseEvent.CLICK,this.onClick);
         this.nextButton = new FSimpleButton();
         this.nextButton.skin = "nextButton";
         addChild(this.nextButton);
         this.nextButton.x = 287;
         this.nextButton.y = 220;
         this.nextButton.addEventListener(MouseEvent.CLICK,this.onClick);
         this.tf = new TextFormat();
         this.tf.align = "center";
         this.dqcs = new FTextArea();
         with(this.dqcs)
         {
            multiline = true;
            filters = StaticValue.filter;
            defaultTextFormat = tf;
            width = 145;
            height = 16;
            x = 140;
            y = 220;
            textColor = StaticValue.WHITE;
            background = true;
            backgroundColor = 1186072;
            htmlText = "";
         }
         addChild(this.dqcs);
         this.sxjc1 = new FTextArea();
         with(this.sxjc1)
         {
            multiline = true;
            filters = StaticValue.filter;
            width = 90;
            height = 16;
            x = 270;
            y = 252;
            textColor = StaticValue.ORANGE;
            htmlText = LanResManager.getLanCommonTextWords("人物属性加成：");
         }
         addChild(this.sxjc1);
         this.sxjc = new FTextArea();
         with(this.sxjc)
         {
            multiline = true;
            filters = StaticValue.filter;
            width = 150;
            height = 110;
            x = 270;
            y = 280;
            textColor = StaticValue.BLUE_HTML;
            htmlText = "";
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
            x = 250;
            y = 303;
            textColor = StaticValue.ORANGE;
            htmlText = LanResManager.getLanCommonTextWords("附带技能：");
         }
         addChild(this.sxjc1);
         this.skillImg = StaticValue.getBitmapByClassName("ui.tiem.slot");
         this.addChild(this.skillImg);
         this.skillImg.x = 340;
         this.skillImg.y = 307;
         this.kuang = StaticValue.getBitmapByClassName("ui.tiem.slot");
         addChild(this.kuang);
         this.kuang.x = 330 + 23;
         this.kuang.y = 305 - 270 + 12;
         this.mainSkillContainer = new Sprite();
         this.mainSkillContainer.x = 342;
         this.mainSkillContainer.y = 309;
         addChild(this.mainSkillContainer);
         this.mainSkillContainer.addEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDown);
         this.mainSkillContainer.addEventListener(MouseEvent.MOUSE_UP,this.onMouseUp);
         this.mainSkillContainer1 = new Sprite();
         this.mainSkillContainer1.x = 332 + 23;
         this.mainSkillContainer1.y = 307 - 270 + 12;
         addChild(this.mainSkillContainer1);
         this.mainSkillContainer1.addEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDown);
         this.mainSkillContainer1.addEventListener(MouseEvent.MOUSE_UP,this.onMouseUp);
         this.lingWuBtn = new SmallButton();
         this.lingWuBtn.label = LanResManager.getLanCommonTextWords("突破本层");
         addChild(this.lingWuBtn);
         this.lingWuBtn.x = 272;
         this.lingWuBtn.y = 325;
         this.lingWuBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.ft_ms = new FTextArea();
         with(this.ft_ms)
         {
            multiline = true;
            wordWrap = true;
            filters = StaticValue.filter;
            width = 190;
            height = 135;
            x = 10;
            y = 252 - 5;
            textColor = StaticValue.GREEN;
            htmlText = "<font size = \'15\'>" + LanResManager.getLanCommonTextWords("蛤蟆功") + "</font>";
         }
         addChild(this.ft_ms);
         this.ft_ms = new FTextArea();
         with(this.ft_ms)
         {
            multiline = true;
            wordWrap = true;
            filters = StaticValue.filter;
            width = 240;
            height = 135;
            x = 10;
            y = 280 - 15;
            textColor = StaticValue.ORANGE;
            htmlText = "<textformat leading=\'1\'><font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("至刚之功，初练此功炼其外劲，增加自身攻击。若练至最高境界，可习得独特的内劲之气，此内劲之气犹如剧毒直伤人内脏，纵是钢筋铁骨，中此内劲也只得束手待死。") + "</font></textformat>";
         }
         addChild(this.ft_ms);
         this.haMaGongTupoCanvas = new HaMaGongTupoCanvas();
         this.haMaGongTupoCanvas._parent2 = this;
         addChild(this.haMaGongTupoCanvas);
         this.haMaGongTupoCanvas.x = 138;
         this.haMaGongTupoCanvas.y = -10;
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
         this.haMaGongTupoCanvas.mask = $mask;
         addEventListener(UI_HAMAGONGTUPO_GUANBI_CLICK,this.aa1);
         this.fts = new FTextArea();
         this.fts.x = 10;
         this.fts.y = 10;
         this.fts.textColor = StaticValue.RED;
         this.fts.filters = StaticValue.filter;
         this.fts.width = 170;
         this.fts.height = 20;
         this.fts.htmlText = "";
         ToolTips.createToolTips(this.fts,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("蛤蟆玉毒功法") + "<br>" + LanResManager.getLanCommonTextWords("攻击2288888、血量488888888、人物全属性提升10%") + "<br>" + LanResManager.getLanCommonTextWords("同时获得蛤蟆玉毒功法技能效果，攻击时，有几率触发60秒效果的玉毒功法技能，且在这60秒期间内，") + "<br>" + LanResManager.getLanCommonTextWords("对手只要使用巧克力等任何补血药品都将无效，同时将造成毒伤反效果（每次使用都将毒伤5%血量）") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.fts2 = new FTextArea();
         this.fts2.x = 262;
         this.fts2.y = 10;
         this.fts2.textColor = StaticValue.GREEN;
         this.fts2.autoSize = TextFieldAutoSize.LEFT;
         this.fts2.htmlText = LanResManager.getLanCommonTextWords("血玉蟾毒秘技（已激活）");
         this.fts2.visible = false;
         addChild(this.fts2);
         ToolTips.createToolTips(this.fts2,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("攻击2688888888900 防御2288888888900 血量3088888888900 暴击88888 闪避88888 所有武功400000层") + "<br>" + LanResManager.getLanCommonTextWords("血玉蟾毒 —— 为天下最强毒功秘技，玉蟾出，鬼神泣。攻击时，有极高几率触发血玉蟾毒，对手将受到蟾毒伤害") + "，<br>" + LanResManager.getLanCommonTextWords("总血量瞬间降至10%，且无法进行恢复，技能持续5秒！") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.fts3 = new FTextArea();
         this.fts3.x = 10;
         this.fts3.y = 10 + 20;
         this.fts3.textColor = StaticValue.GREEN;
         this.fts3.autoSize = TextFieldAutoSize.LEFT;
         this.fts3.htmlText = LanResManager.getLanCommonTextWords("以战止戈（已激活）");
         this.fts3.visible = false;
         addChild(this.fts3);
         ToolTips.createToolTips(this.fts3,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("增加人物攻击：56888亿、防御52888亿、血量60888亿、所有武功提升 480000层") + "<br>" + LanResManager.getLanCommonTextWords("以战止戈：人物开启进化功能后，攻击时有几率触发以战止戈状态，使对手在接下来的100次攻击全部落空失效。且每攻击对") + "，<br>" + LanResManager.getLanCommonTextWords("手16次必定令对手定身3秒，直至该状态消失") + "</font>";
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
         this.fts4.x = 262 - 15;
         this.fts4.y = 10 + 20;
         this.fts4.textColor = StaticValue.GREEN;
         this.fts4.width = 170;
         this.fts4.height = 20;
         this.fts4.htmlText = LanResManager.getLanCommonTextWords("西毒逆转九阴秘籍(已激活)");
         addChild(this.fts4);
         ToolTips.createToolTips(this.fts4,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("逆转九阴（主动技能）——每次攻击效果都等同于门派第二武学攻击，且攻击时100%触发逆转九阴") + "<br>" + LanResManager.getLanCommonTextWords("效果，使对手变身成蛤蟆，持续3秒，冷却30秒，该主动技能无冷却时间，可一直使用！") + "</font>";
            return _loc1_ + "</textformat>";
         });
      }
      
      private function onCheckClick(param1:MouseEvent) : void
      {
         this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.check.selectState,2]));
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
         if(Math.abs(this.p.x - mouseX) > 5 || Math.abs(this.p.y - mouseY) > 5 || Math.sqrt(this.p.x * this.p.x + this.p.y * this.p.y) > 5)
         {
            if((this.currSkill.getBaseItem() as Skill).res.useway == 1 && (this.currSkill.getBaseItem() as Skill).isLearn == 1)
            {
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_HAMAGONG_SKILL_DRAG,"",this.currSkill));
            }
            this.mainSkillContainer.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
         }
      }
      
      private function onMouseUp(param1:MouseEvent) : void
      {
         this.mainSkillContainer.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
      }
      
      public function set setParent(param1:DisplayObject) : void
      {
         this._$parent = param1;
         this.haMaGongTupoCanvas._parent2 = param1;
         this.haMaGongTupoCanvas._parent3 = this;
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.previousButton:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_HAMAGONG_PREVIOUS_CLICK));
               break;
            case this.nextButton:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_HAMAGONG_NEXT_CLICK));
               break;
            case this.lingWuBtn:
               if(this.tupoBo)
               {
                  return;
               }
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_HAMAGONG_LINGWU_SHOW,""));
         }
      }
      
      private function setJihuo(param1:Boolean) : void
      {
         if(param1)
         {
            this.fts.textColor = StaticValue.GREEN;
            this.fts.htmlText = LanResManager.getLanCommonTextWords("蛤蟆玉毒功法(已激活)");
         }
         else
         {
            this.fts.textColor = StaticValue.RED;
            this.fts.htmlText = LanResManager.getLanCommonTextWords("蛤蟆玉毒功法(未激活)");
         }
      }
      
      public function initilizeUI(param1:Boolean, param2:HaMaGongVO) : void
      {
         this.setZhaoShiMsg(param2.nowLookingName,param2.nowLookingID,param2.nowID + 1,param2.nowID >= 5);
         this.setMainInitialize(param2.act,param2.isUse);
         this.setSkill(new Skill(param2.skillID),param2.isUseSkill);
         this.setJihuo(param2.yuDuGong);
         this.setXueyuchanduJiHuo(param1);
         this.check.selectState = param2.chuanyi;
      }
      
      private function setXueyuchanduJiHuo(param1:Boolean) : void
      {
         if(param1)
         {
            this.fts2.visible = GameState.dictMainStatus[SpecialGoodsID.XUEYUCHANDU_ID];
            this.fts3.visible = GameState.dictMainStatus[SpecialGoodsID.HAMAGONG_SHENZHUANGJINHUA];
            this.check.visible = GameState.dictMainStatus[SpecialGoodsID.HAMAGONG_SHENZHUANGJINHUA];
            this.checkLabel.visible = GameState.dictMainStatus[SpecialGoodsID.HAMAGONG_SHENZHUANGJINHUA];
            this.fts4.visible = GameState.dictMainStatus[SpecialGoodsID.HAMAGONG_XIDUNIZHUAN_ID];
            if(GameState.dictMainStatus[SpecialGoodsID.HAMAGONG_XIDUNIZHUAN_ID])
            {
               this.setSkillJiHuo(200255,true);
               this.mainSkillItemFace1.visible = true;
               this.kuang.visible = true;
            }
            else
            {
               this.mainSkillItemFace1 = null;
               this.kuang.visible = false;
            }
         }
         else
         {
            this.fts2.visible = GameState.dictTargetStatus[SpecialGoodsID.XUEYUCHANDU_ID];
            this.fts3.visible = GameState.dictTargetStatus[SpecialGoodsID.HAMAGONG_SHENZHUANGJINHUA];
            this.check.visible = GameState.dictTargetStatus[SpecialGoodsID.HAMAGONG_SHENZHUANGJINHUA];
            this.checkLabel.visible = GameState.dictTargetStatus[SpecialGoodsID.HAMAGONG_SHENZHUANGJINHUA];
            this.fts4.visible = GameState.dictTargetStatus[SpecialGoodsID.HAMAGONG_XIDUNIZHUAN_ID];
            if(GameState.dictTargetStatus[SpecialGoodsID.HAMAGONG_XIDUNIZHUAN_ID])
            {
               this.setSkillJiHuo(200255,true);
               this.mainSkillItemFace1.visible = true;
               this.kuang.visible = true;
            }
            else
            {
               this.mainSkillItemFace1 = null;
               this.kuang.visible = false;
            }
         }
      }
      
      private function setMainInitialize(param1:int, param2:Boolean) : void
      {
         var _loc3_:String = "";
         _loc3_ += "<textformat leading=\'6\'><font color=\'" + StaticValue.SKY_BLUE_HTML + "\'>";
         if(this.lookingId == 1)
         {
            _loc3_ += LanResManager.getLanCommonTextWords("攻击：+") + param1 + "<br>";
         }
         else if(param2 && this.lookingId == 5)
         {
            _loc3_ += LanResManager.getLanCommonTextWords("攻击：+") + param1 + " X " + this.lookingId + " X " + 2 + "<br>";
         }
         else
         {
            _loc3_ += LanResManager.getLanCommonTextWords("攻击：+") + param1 + " X " + this.lookingId + "<br>";
         }
         _loc3_ += "</font>";
         _loc3_ += "</textformat>";
         this.sxjc.htmlText = _loc3_;
      }
      
      public function setZhaoShiMsg(param1:String, param2:int, param3:int = -1, param4:Boolean = false) : void
      {
         this.lookingId = param2;
         this.dqcs.htmlText = param1;
         if(Boolean(this.bg) && this.bg.parent != null)
         {
            this.bg.parent.removeChild(this.bg);
         }
         this.bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/hamagong/" + param2 + ".swf");
         this.bg.x = 4;
         addChildAt(this.bg,0);
         this.nowLevel = param2;
         this.previousButtonEnabled(true);
         this.lingWuButtonEnabled(true);
         this.nextButtonEnabled(true);
         if(param2 == param3 || param2 == 0)
         {
            this.lingWuBtn.label = LanResManager.getLanCommonTextWords("突破本层");
            this.lingWuButtonEnabled(true);
         }
         else if(param2 < param3)
         {
            this.lingWuBtn.label = LanResManager.getLanCommonTextWords("已突破");
            this.lingWuButtonEnabled(false);
         }
         else
         {
            this.lingWuBtn.label = LanResManager.getLanCommonTextWords("未突破");
            this.lingWuButtonEnabled(false);
         }
         if(param4 || param3 == -1)
         {
            this.lingWuButtonEnabled(false);
         }
         if(this.isLockOn)
         {
            this.lingWuBtn.label = LanResManager.getLanCommonTextWords("突破本层");
         }
         if(param2 == 1)
         {
            this.previousButtonEnabled(false);
         }
         if(param2 == 5)
         {
            this.nextButtonEnabled(false);
         }
      }
      
      public function setSkill(param1:Skill, param2:Boolean) : void
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
      
      public function showHaMaGongLingWuPanel(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.haMaGongTupoCanvas.x == 138)
            {
               TweenMax.to(this.haMaGongTupoCanvas,1,{"x":410});
               this.tupoBo = true;
               this.previousButtonEnabled(false);
               this.nextButtonEnabled(false);
               this.lingWuButtonEnabled(false);
            }
         }
         else if(this.haMaGongTupoCanvas.x == 410)
         {
            TweenMax.to(this.haMaGongTupoCanvas,1,{"x":138});
            this.tupoBo = false;
            this.previousButtonEnabled(true);
            this.nextButtonEnabled(true);
            this.lingWuButtonEnabled(true);
            if(this.nowLevel == 1)
            {
               this.previousButtonEnabled(false);
            }
            if(this.nowLevel == 5)
            {
               this.nextButtonEnabled(false);
            }
            this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_HAMAGONG_ZIDONGTISHENG_CLICKJ,"",false));
         }
      }
      
      public function isHaMaGongtupoCanvasShow() : Boolean
      {
         if(this.haMaGongTupoCanvas.x == 410)
         {
            return true;
         }
         return false;
      }
      
      public function setInitialize(param1:String, param2:Boolean, param3:String, param4:int, param5:Boolean, param6:int) : void
      {
         this.haMaGongTupoCanvas.setInitialize(param1,param2,param3,param4,param5,param6);
      }
      
      public function setZhufuzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this.haMaGongTupoCanvas.setZhufuzhi(param1,param2,param3);
      }
      
      public function setGoods(param1:Goods, param2:Boolean) : void
      {
         this.haMaGongTupoCanvas.setGoods(param1,param2);
      }
      
      public function setShuoming(param1:String) : void
      {
         this.haMaGongTupoCanvas.setShuoming(param1);
      }
      
      public function setBtn(param1:Boolean) : void
      {
         this.haMaGongTupoCanvas.setBtn(param1);
      }
      
      private function aa1(param1:BaseEvent) : void
      {
         this.showHaMaGongLingWuPanel(false);
      }
      
      public function lockOn() : void
      {
         this.previousButtonEnabled(false);
         this.nextButtonEnabled(false);
         this.lingWuButtonEnabled(false);
         this.check.enabled = false;
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
      
      public function setSkillJiHuo(param1:int, param2:Boolean) : void
      {
         if(this.mainSkillItemFace1)
         {
            if(this.mainSkillItemFace1.parent)
            {
               this.mainSkillItemFace1.parent.removeChild(this.mainSkillItemFace1);
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
         this.mainSkillItemFace1 = new ItemFace(this.mainSkill);
         this.mainSkillItemFace1.showKungFuTag();
         this.mainSkillItemFace1.setShowCount(false);
         this.mainSkillItemFace1.x = 23;
         this.mainSkillItemFace1.y = 12 - 270;
         this.mainSkillContainer.addChild(this.mainSkillItemFace1);
      }
   }
}

