package com.tgame.shell.view.components.attribute
{
   import br.com.stimuli.loading.loadingtypes.LoadingItem;
   import com.fireice.checkBox.FCheckBox;
   import com.fireice.list.FList;
   import com.fireice.panel.FCanvas;
   import com.fireice.scroll.FVScorllBar;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.F9GridBitmap;
   import com.fireice.util.Tools;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameState;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.utils.ToolTips;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.common.vo.item.Skill;
   import com.tgame.shell.view.components.CharAttribute;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.loader.vo.LoadData;
   import com.zcp.manager.LoaderManager;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.text.*;
   import gs.TweenMax;
   
   public class ZiXiaShenGong extends Sprite
   {
      
      public static const UI_ZIXIASHENGONGTUPO_GUANBI_CLICKJ:String = "UI_ZIXIASHENGONGTUPO_GUANBI_CLICKJ";
      
      public var bgImg:Bitmap;
      
      public var _parent:DisplayObject;
      
      private var fc:FCanvas;
      
      private var fta:FTextArea;
      
      private var fta1:FTextArea;
      
      private var zuox:int = 210;
      
      private var youx:int = 190;
      
      private var _avatar:Bitmap;
      
      private var listContainer:Sprite;
      
      private var giftList:FList;
      
      private var Scroll:FVScorllBar;
      
      private var djtpBtn:SecondButton;
      
      private var zixiashengongtupoCanvas:ZixiashengongTupoCanvas;
      
      public var tupoBo:Boolean = false;
      
      private var djtpBtnBo:Boolean = false;
      
      private var mc_:int = -1;
      
      private var mcObj:Object;
      
      private var loadUrl1:String;
      
      private var gongMc1:MovieClip;
      
      private var bg9:F9GridBitmap;
      
      private var check:FCheckBox;
      
      private var fts:FTextArea;
      
      private var fts1:FTextArea;
      
      private var fts2:FTextArea;
      
      private var lianticishu:int = 0;
      
      private var fts3:FTextArea;
      
      private var mainSkillContainer:Sprite;
      
      private var currSkill:ItemFace;
      
      private var p:Point;
      
      private var mainSkillItemFace:ItemFace;
      
      private var mainSkill:Skill;
      
      private var kuang1:Bitmap;
      
      private var fts4:FTextArea;
      
      private var checkZhenQi:FCheckBox;
      
      private var fts5:FTextArea;
      
      private var checkZq:FCheckBox;
      
      private var fts6:FTextArea;
      
      public function ZiXiaShenGong()
      {
         var lb:FLabel;
         var $mask:Sprite;
         this.mcObj = {};
         super();
         this.bgImg = new Bitmap();
         this.bgImg.name = "ui.char.zixiashengong.bg";
         addChild(this.bgImg);
         this.fc = new FCanvas();
         this.fc.x = 0;
         this.fc.y = 223;
         this.fc.width = 221;
         this.fc.height = 141;
         this.fc.skin = "box_transparence";
         addChild(this.fc);
         this.fc = new FCanvas();
         this.fc.x = 0;
         this.fc.y = 0;
         this.fc.width = 403;
         this.fc.height = 195 + 171;
         this.fc.skin = "box_transparence";
         addChild(this.fc);
         this.fc = new FCanvas();
         this.fc.x = 220;
         this.fc.y = 158;
         this.fc.width = 162;
         this.fc.height = 206;
         this.fc.skin = "box";
         addChild(this.fc);
         this.bg9 = Tools.get9GridBitmpByName("biwuDahui_bg");
         this.bg9.width = 217;
         this.bg9.height = 137;
         addChild(this.bg9);
         this.bg9.x = 2;
         this.bg9.y = 225;
         this.fta = new FTextArea();
         with(this.fta)
         {
            filters = StaticValue.filter;
            x = 63 + zuox;
            y = 10;
            textColor = StaticValue.ORANGE;
            autoSize = TextFieldAutoSize.LEFT;
            htmlText = "<font size=\'16\'>" + LanResManager.getLanCommonTextWords("紫霞神功") + "</font>";
         }
         addChild(this.fta);
         this.fta = new FTextArea();
         with(this.fta)
         {
            filters = StaticValue.filter;
            width = 180;
            height = 150;
            x = 10 + zuox - 1 + 5;
            y = 30;
            textColor = StaticValue.SKY_BLUE;
            wordWrap = true;
            htmlText = "<textformat leading=\'6\'>" + LanResManager.getLanCommonTextWords("华山派称誉江湖的上乘内功。它初发时若有若无，绵如云霞，然而蓄劲极韧，到后来铺天盖地，势不可当。发功之人脸上满布紫气，故有") + "<font color=\'" + StaticValue.PURPLE50_HTML + "\'>" + LanResManager.getLanCommonTextWords("“紫霞”") + "</font>" + LanResManager.getLanCommonTextWords("之称。") + "<br>" + LanResManager.getLanCommonTextWords("人道") + "<font color=\'" + StaticValue.PURPLE50_HTML + "\'>" + LanResManager.getLanCommonTextWords("“华山九功第一紫霞”") + "</font>" + "</textformat>";
         }
         addChild(this.fta);
         this._avatar = new Bitmap();
         addChildAt(this._avatar,1);
         this.listContainer = new Sprite();
         addChild(this.listContainer);
         with(this.listContainer)
         {
            x = 2 + zuox;
            y = 160;
            graphics.beginFill(16711680,0);
            graphics.drawRect(0,0,174,200);
            graphics.endFill();
         }
         this.giftList = new FList();
         this.giftList.skin = "list";
         this.giftList.itemRenderer = new ZiXiaShenGongList();
         this.giftList.listWidth = 160;
         this.listContainer.addChild(this.giftList);
         this.giftList.x = 10;
         this.giftList.y = 0;
         this.giftList.addEventListener(MouseEvent.CLICK,this.onListClick);
         this.Scroll = new FVScorllBar(this.listContainer,202);
         addChild(this.Scroll);
         this.Scroll.x = 173 + this.zuox;
         this.Scroll.y = 158;
         this.fta = new FTextArea();
         with(this.fta)
         {
            filters = StaticValue.filter;
            x = 49;
            y = 232;
            textColor = StaticValue.ORANGE;
            autoSize = TextFieldAutoSize.LEFT;
            htmlText = LanResManager.getLanCommonTextWords("当前神功加成如下属性");
         }
         addChild(this.fta);
         this.fta1 = new FTextArea();
         with(this.fta1)
         {
            filters = StaticValue.filter;
            x = 200 - youx + 5;
            y = 257;
            textColor = StaticValue.YELLOW;
            autoSize = TextFieldAutoSize.LEFT;
            htmlText = "";
         }
         addChild(this.fta1);
         this.djtpBtn = new SecondButton();
         this.djtpBtn.label = LanResManager.getLanCommonTextWords("领悟本式");
         addChild(this.djtpBtn);
         this.djtpBtn.x = 100;
         this.djtpBtn.y = 336;
         this.djtpBtn.addEventListener(MouseEvent.MOUSE_UP,this.onClick);
         this.check = new FCheckBox();
         addChild(this.check);
         this.check.x = 55 - 2 - 2 - 3 + 20;
         this.check.y = 125 + 2 + 70 - 17 + 20;
         this.check.addEventListener(MouseEvent.CLICK,this.onClick);
         lb = new FLabel();
         with(lb)
         {
            x = 70 - 2 - 3 + 20;
            y = 125 + 3 + 1 + 70 - 17 + 20;
            textColor = StaticValue.GREEN;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("外观显示");
         }
         addChild(lb);
         this.zixiashengongtupoCanvas = new ZixiashengongTupoCanvas();
         addChild(this.zixiashengongtupoCanvas);
         this.zixiashengongtupoCanvas.x = 138;
         this.zixiashengongtupoCanvas.y = -10;
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
         this.zixiashengongtupoCanvas.mask = $mask;
         addEventListener(UI_ZIXIASHENGONGTUPO_GUANBI_CLICKJ,this.aa1);
         this.fts = new FTextArea();
         this.fts.x = 10;
         this.fts.y = 10;
         this.fts.textColor = StaticValue.RED;
         this.fts.width = 170;
         this.fts.height = 20;
         this.fts.htmlText = LanResManager.getLanCommonTextWords("紫霞神功顶级属性(未激活)");
         addChild(this.fts);
         ToolTips.createToolTips(this.fts,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("攻击1288888、防御 888888、血量8888888 、暴击 88、闪避88") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.fts1 = new FTextArea();
         this.fts1.x = 10;
         this.fts1.y = 30;
         this.fts1.textColor = StaticValue.GREEN;
         this.fts1.width = 200;
         this.fts1.height = 20;
         this.fts1.htmlText = LanResManager.getLanCommonTextWords("紫霞神功究极（已激活）");
         this.fts1.visible = false;
         addChild(this.fts1);
         ToolTips.createToolTips(this.fts1,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("攻击2088888888 防御1688888888 暴击2888 闪避2888血量2088888888、所有武功提升2180层") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.fts2 = new FTextArea();
         this.fts2.x = 10;
         this.fts2.y = 30 + 20;
         this.fts2.textColor = StaticValue.GREEN;
         this.fts2.width = 170 + 20;
         this.fts2.height = 20;
         this.fts2.htmlText = LanResManager.getLanCommonTextWords("紫霞内功心法（已激活）");
         this.fts2.visible = false;
         addChild(this.fts2);
         ToolTips.createToolTips(this.fts2,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("提升属性：攻击：38888亿、防御36888亿、血量40888亿、所有武功提升 350000层") + "<br>" + LanResManager.getLanCommonTextWords("特殊属性：激活该秘籍后，每天0点时分，可自动运行该功法一次，每次可自动增加攻击200亿，") + "<br>" + LanResManager.getLanCommonTextWords("所有武功提升10000层！（最多可运行5000次！）") + "<br>" + LanResManager.getLanCommonTextWords("已运行") + lianticishu + LanResManager.getLanCommonTextWords("次") + "<br>" + LanResManager.getLanCommonTextWords("增加攻击") + lianticishu * 200 + LanResManager.getLanCommonTextWords("亿  提升武功") + lianticishu * 10000 + LanResManager.getLanCommonTextWords("层");
            return _loc1_ + "</textformat>";
         });
         this.fts3 = new FTextArea();
         this.fts3.x = 20 + 208 - 220;
         this.fts3.y = 20 + 185;
         this.fts3.textColor = StaticValue.GREEN;
         this.fts3.width = 170;
         this.fts3.height = 20;
         this.fts3.htmlText = LanResManager.getLanCommonTextWords("送你回千里之外");
         addChild(this.fts3);
         this.kuang1 = StaticValue.getBitmapByClassName("ui.tiem.slot");
         addChild(this.kuang1);
         this.kuang1.x = 25 + 324 - 334;
         this.kuang1.y = 160 + 35 - 186 + 150;
         this.mainSkillContainer = new Sprite();
         this.mainSkillContainer.x = 25 + 2 + 324 - 334;
         this.mainSkillContainer.y = 160 + 2 + 35 - 186 + 150;
         addChild(this.mainSkillContainer);
         this.mainSkillContainer.addEventListener(MouseEvent.MOUSE_DOWN,this.onSkillMouseDown);
         this.mainSkillContainer.addEventListener(MouseEvent.MOUSE_UP,this.onSkillMouseUp);
         this.fts4 = new FTextArea();
         this.fts4.x = 10;
         this.fts4.y = 30 + 20 + 20 + 20;
         this.fts4.textColor = StaticValue.GREEN;
         this.fts4.width = 130;
         this.fts4.height = 20;
         this.fts4.htmlText = LanResManager.getLanCommonTextWords("紫霞神功秘籍（已激活）");
         this.fts4.visible = false;
         addChild(this.fts4);
         ToolTips.createToolTips(this.fts4,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("开启紫霞神功紫阴内力之气，人物打坐可将这股真气包裹在外，产生眩丽的外观。");
            return _loc1_ + "</textformat>";
         });
         this.checkZhenQi = new FCheckBox();
         addChild(this.checkZhenQi);
         this.checkZhenQi.x = 120 + 22;
         this.checkZhenQi.y = 30 + 20 + 20 + 20;
         this.checkZhenQi.addEventListener(MouseEvent.CLICK,this.onCheckClick);
         this.fts5 = new FTextArea();
         this.fts5.x = 10;
         this.fts5.y = 30 + 20 + 20 + 20 + 25;
         this.fts5.textColor = StaticValue.GREEN;
         this.fts5.width = 130;
         this.fts5.height = 20;
         this.fts5.htmlText = LanResManager.getLanCommonTextWords("华山熔岩瑞兽（已激活）");
         this.fts5.visible = false;
         addChild(this.fts5);
         ToolTips.createToolTips(this.fts5,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("攻击：56888亿、防御52888亿、血量60888亿、所有武功提升 480000层") + "<br>" + LanResManager.getLanCommonTextWords("华山熔岩瑞兽：双击使用，人物可获得上古魔兽-熔岩瑞兽。瑞兽一出，风云惊变。") + "<br>" + LanResManager.getLanCommonTextWords("瑞兽狂怒：上古10大魔兽之首，攻击时有几率触发瑞兽狂怒状态，瞬间震慑五格内") + "<br>" + LanResManager.getLanCommonTextWords("所有玩家，受到兽吼扰心，瞬间定格在原地10秒，且自身受到魔兽庇佑，每次攻击") + "<br>" + LanResManager.getLanCommonTextWords("都使对手失去视野，且每秒必定使对手掉血40%，持续5秒。") + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.checkZq = new FCheckBox();
         addChild(this.checkZq);
         this.checkZq.x = 120 + 22;
         this.checkZq.y = 30 + 20 + 20 + 20 + 25;
         this.checkZq.addEventListener(MouseEvent.CLICK,this.onCheckClick);
         this.fts6 = new FTextArea();
         this.fts6.x = 10;
         this.fts6.y = 30 + 20 + 20 + 20 + 25 + 20;
         this.fts6.textColor = StaticValue.GREEN;
         this.fts6.width = 130;
         this.fts6.height = 20;
         this.fts6.htmlText = new Goods(SpecialGoodsID.ZIXIASHENGONG_ZIXIAZHISHU_ID).res.name;
         this.fts6.visible = false;
         addChild(this.fts6);
         ToolTips.createToolTips(this.fts6,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + new Goods(SpecialGoodsID.ZIXIASHENGONG_ZIXIAZHISHU_ID).res.desc;
            return _loc1_ + "</textformat>";
         });
      }
      
      private function onCheckClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.checkZhenQi:
               this._parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.checkZhenQi.selectState,44]));
               break;
            case this.checkZq:
               this._parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.checkZq.selectState,43]));
         }
      }
      
      private function onListClick(param1:MouseEvent) : void
      {
         if(this.giftList.selectItem == null)
         {
            return;
         }
         var _loc2_:String = "";
         var _loc3_:String = "";
         this.setMc(this.giftList.selectItem.id);
         if(this.giftList.selectItem.dangqian)
         {
            if(this.djtpBtnBo)
            {
               this.djtpBtn.enabled = false;
               this.djtpBtn.label = LanResManager.getLanCommonTextWords("领悟本式");
            }
            else
            {
               this.djtpBtn.enabled = true;
               this.djtpBtn.label = LanResManager.getLanCommonTextWords("领悟本式");
               this._parent.dispatchEvent(new BaseEvent(CharAttribute.UI_ZIXIASHENGONG_DENGJITUPO_CLICKJ,"",this.giftList.selectItem.id));
            }
         }
         else
         {
            if(this.giftList.selectItem.lingwu)
            {
               this.djtpBtn.enabled = false;
               this.djtpBtn.label = LanResManager.getLanCommonTextWords("已领悟");
            }
            else
            {
               this.djtpBtn.enabled = false;
               this.djtpBtn.label = LanResManager.getLanCommonTextWords("未领悟");
            }
            this.onShowLv(false);
         }
      }
      
      private function aa1(param1:BaseEvent) : void
      {
         this.onShowLv(false);
      }
      
      public function set setParent(param1:DisplayObject) : void
      {
         this._parent = param1;
         this.zixiashengongtupoCanvas._parent = this;
         this.zixiashengongtupoCanvas._parent2 = param1;
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.djtpBtn:
               this._parent.dispatchEvent(new BaseEvent(CharAttribute.UI_ZIXIASHENGONG_DENGJITUPO_CLICKJ,"",this.giftList.selectItem.id));
         }
         switch(param1.currentTarget)
         {
            case this.check:
               this._parent.dispatchEvent(new BaseEvent(CharAttribute.UI_ZIXIASHENGONG_EFFECT_SHOW,"",this.check.selectState));
         }
      }
      
      public function setInitialize(param1:Boolean, param2:Array, param3:int) : void
      {
         this.giftList.dataProvider = param2;
         this.Scroll.update();
         this.giftList.setSelectItemByIndex(param3);
         this.Scroll.setScrollPosition(80 * param3);
         if(this.giftList.selectItem.lingwu)
         {
            this.djtpBtn.enabled = false;
            this.djtpBtn.label = LanResManager.getLanCommonTextWords("已领悟");
         }
         else
         {
            this.djtpBtn.enabled = true;
            this.djtpBtn.label = LanResManager.getLanCommonTextWords("领悟本式");
         }
         this.setJiHuo(param1);
      }
      
      public function setZuoQiDaZuo(param1:*, param2:*) : void
      {
         this.checkZhenQi.selectState = param2;
         this.checkZq.selectState = param1;
      }
      
      public function setJiHuo(param1:Boolean) : void
      {
         if(param1)
         {
            this.fts1.visible = GameState.dictMainStatus[SpecialGoodsID.ZIXIASHENGONG_JIUJI_ID];
            this.fts2.visible = GameState.dictMainStatus[SpecialGoodsID.ZIXIASHENGONG_NEIGONG_ID];
            this.fts3.visible = GameState.dictMainStatus[SpecialGoodsID.ZIXIASHENGONG_QIANLIZHIWAI_ID];
            if(GameState.dictMainStatus[SpecialGoodsID.ZIXIASHENGONG_QIANLIZHIWAI_ID])
            {
               this.setSkillJiHuo(200259,true);
               this.mainSkillContainer.visible = true;
               this.kuang1.visible = true;
            }
            else
            {
               this.mainSkillContainer.visible = false;
               this.kuang1.visible = false;
            }
            this.fts4.visible = GameState.dictMainStatus[SpecialGoodsID.ZIXIASHENGONG_ZIXIASHENGONGMIJI_ID];
            this.checkZhenQi.visible = GameState.dictMainStatus[SpecialGoodsID.ZIXIASHENGONG_ZIXIASHENGONGMIJI_ID];
            if(GameState.dictMainStatus[SpecialGoodsID.ZIXIASHENGONG_HUASHANRONGYAN_ID])
            {
               this.fts5.visible = true;
               this.checkZq.visible = true;
            }
            else
            {
               this.fts5.visible = false;
               this.checkZq.visible = false;
            }
            this.fts6.visible = GameState.dictMainStatus[SpecialGoodsID.ZIXIASHENGONG_ZIXIAZHISHU_ID];
         }
         else
         {
            this.fts1.visible = GameState.dictTargetStatus[SpecialGoodsID.ZIXIASHENGONG_JIUJI_ID];
            this.fts2.visible = GameState.dictTargetStatus[SpecialGoodsID.ZIXIASHENGONG_NEIGONG_ID];
            this.fts3.visible = GameState.dictTargetStatus[SpecialGoodsID.ZIXIASHENGONG_QIANLIZHIWAI_ID];
            if(GameState.dictTargetStatus[SpecialGoodsID.ZIXIASHENGONG_QIANLIZHIWAI_ID])
            {
               this.setSkillJiHuo(200259,true);
               this.mainSkillContainer.visible = true;
               this.kuang1.visible = true;
            }
            else
            {
               this.mainSkillContainer.visible = false;
               this.kuang1.visible = false;
            }
            this.fts4.visible = GameState.dictTargetStatus[SpecialGoodsID.ZIXIASHENGONG_ZIXIASHENGONGMIJI_ID];
            this.checkZhenQi.visible = GameState.dictTargetStatus[SpecialGoodsID.ZIXIASHENGONG_ZIXIASHENGONGMIJI_ID];
            if(GameState.dictTargetStatus[SpecialGoodsID.ZIXIASHENGONG_HUASHANRONGYAN_ID])
            {
               this.fts5.visible = true;
               this.checkZq.visible = true;
            }
            else
            {
               this.fts5.visible = false;
               this.checkZq.visible = false;
            }
            this.fts6.visible = GameState.dictTargetStatus[SpecialGoodsID.ZIXIASHENGONG_ZIXIAZHISHU_ID];
         }
      }
      
      public function set avatar(param1:BitmapData) : void
      {
         this._avatar.bitmapData = param1;
         if(!param1)
         {
            return;
         }
         this._avatar.x = 300 - this._avatar.width / 2 - this.youx;
         this._avatar.y = 150 - this._avatar.height + 40;
      }
      
      public function setShuxingNum(param1:Boolean, param2:Array, param3:Boolean, param4:int) : void
      {
         if(param3)
         {
            this.fts.textColor = StaticValue.GREEN;
            this.fts.htmlText = LanResManager.getLanCommonTextWords("紫霞神功顶级属性(已激活)");
         }
         else
         {
            this.fts.textColor = StaticValue.RED;
            this.fts.htmlText = LanResManager.getLanCommonTextWords("紫霞神功顶级属性(未激活)");
         }
         if(param1)
         {
            this.fta1.htmlText = "<textformat leading=\'1\'>" + LanResManager.getLanCommonTextWords("加攻击：") + param2[0] + " " + "X" + " 2" + "<br>" + LanResManager.getLanCommonTextWords("加防御：") + param2[1] + " " + "X" + " 2" + "<br>" + LanResManager.getLanCommonTextWords("加生命：") + param2[4] + " " + "X" + " 2" + "<br>" + LanResManager.getLanCommonTextWords("加内力：") + param2[2] + "<br>" + LanResManager.getLanCommonTextWords("加体力：") + param2[3] + "<br>" + "</textformat>";
         }
         else
         {
            this.fta1.htmlText = "<textformat leading=\'1\'>" + LanResManager.getLanCommonTextWords("加攻击：") + param2[0] + "<br>" + LanResManager.getLanCommonTextWords("加防御：") + param2[1] + "<br>" + LanResManager.getLanCommonTextWords("加内力：") + param2[2] + "<br>" + LanResManager.getLanCommonTextWords("加体力：") + param2[3] + "<br>" + LanResManager.getLanCommonTextWords("加生命：") + param2[4] + "</textformat>";
         }
         this.lianticishu = param4;
      }
      
      public function setMc(param1:int) : void
      {
         var _loc2_:Array = null;
         if(this.gongMc1 != null && this.gongMc1.parent != null)
         {
            this.gongMc1.stop();
            this.gongMc1.parent.removeChild(this.gongMc1);
         }
         if(this.mcObj["gongMc" + param1] != null)
         {
            this.gongMc1 = this.mcObj["gongMc" + param1];
            if(this.gongMc1)
            {
               this.gongMc1.play();
               this.gongMc1.x = 2;
               this.gongMc1.y = 23;
               addChildAt(this.gongMc1,2);
            }
         }
         else
         {
            this.loadUrl1 = GameConfig.fileBaseFolder + "res/data/mc/zixiashengong/" + (param1 + 1) + ".swf";
            _loc2_ = [new LoadData(this.loadUrl1,this.com,null,null,"","gongMc" + param1)];
            LoaderManager.load(_loc2_);
         }
      }
      
      private function com(param1:Event) : void
      {
         var _loc2_:LoadingItem = param1.target as LoadingItem;
         var _loc3_:String = _loc2_._id;
         if(_loc2_.url.url != this.loadUrl1)
         {
            return;
         }
         if(this.gongMc1 != null && this.gongMc1.parent != null)
         {
            this.gongMc1.stop();
            this.gongMc1.parent.removeChild(this.gongMc1);
         }
         this.gongMc1 = _loc2_.content as MovieClip;
         this.mcObj[_loc3_] = this.gongMc1;
         if(this.gongMc1)
         {
            this.gongMc1.x = 2;
            this.gongMc1.y = 23;
            addChildAt(this.gongMc1,2);
         }
      }
      
      public function removeMc() : void
      {
         if(Boolean(this.gongMc1) && this.gongMc1.parent != null)
         {
            this.gongMc1.stop();
            this.gongMc1.parent.removeChild(this.gongMc1);
         }
      }
      
      public function onShowLv(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.zixiashengongtupoCanvas.x == 138)
            {
               TweenMax.to(this.zixiashengongtupoCanvas,1,{"x":410});
               this.tupoBo = true;
            }
         }
         else
         {
            if(this.zixiashengongtupoCanvas.x == 410)
            {
               TweenMax.to(this.zixiashengongtupoCanvas,1,{"x":138});
               this._parent.dispatchEvent(new BaseEvent(CharAttribute.UI_ZIXIASHENGONG_ZIDONGTISHENG_CLICKJ,"",false));
               this.tupoBo = false;
            }
            this.zixiashengongtupoCanvas.check.selectState = false;
            this.zixiashengongtupoCanvas.check.enabled = true;
            this.zixiashengongtupoCanvas.zdlwBtn.enabled = true;
         }
      }
      
      public function setZixiaInitializeTupo(param1:String, param2:Boolean, param3:String, param4:int, param5:Boolean, param6:int) : void
      {
         this.zixiashengongtupoCanvas.setInitialize(param1,param2,param3,param4,param5,param6);
      }
      
      public function setZhufuzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this.zixiashengongtupoCanvas.setZhufuzhi(param1,param2,param3);
      }
      
      public function setGoods(param1:Goods) : void
      {
         this.zixiashengongtupoCanvas.setGoods(param1);
      }
      
      public function setBtn(param1:Boolean) : void
      {
         this.zixiashengongtupoCanvas.setBtn(param1);
      }
      
      public function setZiXiaEnabledFun() : void
      {
         this.djtpBtn.enabled = false;
         this.djtpBtnBo = true;
      }
      
      public function setShow(param1:Boolean) : void
      {
         this.check.selectState = param1;
      }
      
      public function setZiXiaCheckEnabledFun() : void
      {
         this.check.enabled = false;
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
               this._parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DINGCHANJUE_SKILL_DRAG,"",this.currSkill));
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

