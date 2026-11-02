package com.tgame.shell.view.components.attribute
{
   import br.com.stimuli.loading.loadingtypes.LoadingItem;
   import com.fireice.checkBox.FCheckBox;
   import com.fireice.list.FList;
   import com.fireice.scroll.FVScorllBar;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameState;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.staticdata.ItemPositionRange;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.utils.ToolTips;
   import com.tgame.common.vo.item.Goods;
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
   import flash.text.*;
   import gs.TweenMax;
   
   public class DuguJiujian extends Sprite
   {
      
      public static const UI_DUGUJIUJIANTIPO_GUANBI_CLICK:String = "UI_DUGUJIUJIANTIPO_GUANBI_CLICK";
      
      public var bgImg:Bitmap;
      
      public var _parent:DisplayObject;
      
      private var fta:FTextArea;
      
      private var shuxingFta1:FTextArea;
      
      private var shuxingFta2:FTextArea;
      
      private var miaoshuFta:FTextArea;
      
      private var listContainer:Sprite;
      
      private var giftList:FList;
      
      private var Scroll:FVScorllBar;
      
      private var djtpBtn:SecondButton;
      
      private var djtpBtnBo:Boolean = true;
      
      private var _avatar:Bitmap;
      
      private var loadUrl1:String;
      
      private var gongMc1:MovieClip;
      
      private var dugujiujiantupoCanvas:DuguJiujianTupoCanvas;
      
      private var yanhuaMc:MovieClip;
      
      private var no10Mc:MovieClip;
      
      public var tupoBo:Boolean = false;
      
      private var check:FCheckBox;
      
      private var jihuoFt:FTextArea;
      
      private var btnYC:SecondButton;
      
      private var mc_:int = -1;
      
      private var mcObj:Object;
      
      private var fts:FTextArea;
      
      private var fts1:FTextArea;
      
      private var fts2:FTextArea;
      
      private var fts4:FTextArea;
      
      private var fts4num:int;
      
      private var equipContainers:Sprite;
      
      private var isMain:Boolean;
      
      private var kuangHD:Bitmap;
      
      private var kuangSpr:Sprite;
      
      private var fts3:FTextArea;
      
      private var mcArr:Object;
      
      public function DuguJiujian()
      {
         var lb:FLabel;
         var i:int;
         var $mask:Sprite = null;
         this.mcObj = {};
         this.mcArr = {};
         super();
         this.bgImg = new Bitmap();
         this.bgImg.name = "ui.char.dugu.bg";
         addChild(this.bgImg);
         this.fta = new FTextArea();
         with(this.fta)
         {
            filters = StaticValue.filter;
            x = 20;
            y = 10;
            textColor = StaticValue.ORANGE;
            autoSize = TextFieldAutoSize.LEFT;
            htmlText = "<font size=\'16\'>" + LanResManager.getLanCommonTextWords("天下武学，唯破不破") + "</font>";
         }
         addChild(this.fta);
         this.fta = new FTextArea();
         with(this.fta)
         {
            filters = StaticValue.filter;
            width = 190;
            height = 140;
            x = 10;
            y = 30;
            wordWrap = true;
            htmlText = "<textformat leading=\'1\'>" + "<font color=\'" + StaticValue.SKY_BLUE_HTML + "\'>" + LanResManager.getLanCommonTextWords("独孤九剑为“剑魔”独孤求败传下的一套无招胜有招的绝世心诀。") + "</font>" + "<font color=\'" + StaticValue.PURPLE50_HTML + "\'>" + LanResManager.getLanCommonTextWords("本心诀总计九式，修成之后可破天下武功，天下至强攻即为天下至强防。") + "</font>" + "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("本心法修炼之道并非刻苦修炼可成，领悟力将会至关重要，凡能修成本心决者均为大智慧者。") + "</font>" + "</textformat>";
         }
         addChild(this.fta);
         this._avatar = new Bitmap();
         addChildAt(this._avatar,1);
         this.check = new FCheckBox();
         addChild(this.check);
         this.check.x = 55 - 2 - 2 - 3 + 210 + 7;
         this.check.y = 125 + 2 + 70 - 17 - 5;
         this.check.addEventListener(MouseEvent.CLICK,this.onClick);
         lb = new FLabel();
         with(lb)
         {
            x = 70 - 2 - 3 + 210 + 7;
            y = 125 + 3 + 1 + 70 - 17 - 5;
            textColor = StaticValue.GREEN;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("外观显示");
         }
         addChild(lb);
         this.listContainer = new Sprite();
         addChild(this.listContainer);
         with(this.listContainer)
         {
            x = 2;
            y = 160;
            graphics.beginFill(16711680,0);
            graphics.drawRect(0,0,174,200);
            graphics.endFill();
         }
         this.giftList = new FList();
         this.giftList.skin = "list";
         this.giftList.itemRenderer = new DuguJiujianList();
         this.giftList.listWidth = 174;
         this.listContainer.addChild(this.giftList);
         this.giftList.x = 0;
         this.giftList.y = 0;
         this.giftList.addEventListener(MouseEvent.CLICK,this.onListClick);
         this.Scroll = new FVScorllBar(this.listContainer,200);
         addChild(this.Scroll);
         this.Scroll.x = 178;
         this.Scroll.y = 160;
         this.fta = new FTextArea();
         with(this.fta)
         {
            filters = StaticValue.filter;
            x = 195;
            y = 205;
            textColor = StaticValue.ORANGE;
            autoSize = TextFieldAutoSize.LEFT;
            htmlText = LanResManager.getLanCommonTextWords("悟通本式加成如下属性：");
         }
         addChild(this.fta);
         this.fta = new FTextArea();
         with(this.fta)
         {
            filters = StaticValue.filter;
            x = 200;
            y = 223;
            textColor = StaticValue.YELLOW;
            autoSize = TextFieldAutoSize.LEFT;
            htmlText = LanResManager.getLanCommonTextWords("加攻击：") + "<br>" + LanResManager.getLanCommonTextWords("加生命：") + "<br>" + LanResManager.getLanCommonTextWords("加体力：");
         }
         addChild(this.fta);
         this.shuxingFta1 = new FTextArea();
         with(this.shuxingFta1)
         {
            filters = StaticValue.filter;
            x = 248;
            y = 223;
            textColor = StaticValue.YELLOW;
            autoSize = TextFieldAutoSize.LEFT;
            htmlText = "";
         }
         addChild(this.shuxingFta1);
         this.fta = new FTextArea();
         with(this.fta)
         {
            filters = StaticValue.filter;
            x = 302;
            y = 223;
            textColor = StaticValue.YELLOW;
            autoSize = TextFieldAutoSize.LEFT;
            htmlText = LanResManager.getLanCommonTextWords("加防御：") + "<br>" + LanResManager.getLanCommonTextWords("加内力：");
         }
         addChild(this.fta);
         this.shuxingFta2 = new FTextArea();
         with(this.shuxingFta2)
         {
            filters = StaticValue.filter;
            x = 350;
            y = 223;
            textColor = StaticValue.YELLOW;
            autoSize = TextFieldAutoSize.LEFT;
            htmlText = "";
         }
         addChild(this.shuxingFta2);
         this.miaoshuFta = new FTextArea();
         with(this.miaoshuFta)
         {
            filters = StaticValue.filter;
            x = 198;
            y = 280;
            width = 200;
            height = 70;
            textColor = StaticValue.ORANGE;
            wordWrap = true;
            htmlText = "";
         }
         addChild(this.miaoshuFta);
         this.djtpBtn = new SecondButton();
         this.djtpBtn.label = LanResManager.getLanCommonTextWords("领悟本式");
         addChild(this.djtpBtn);
         this.djtpBtn.x = 280;
         this.djtpBtn.y = 335;
         this.djtpBtn.addEventListener(MouseEvent.MOUSE_UP,this.onClick);
         this.dugujiujiantupoCanvas = new DuguJiujianTupoCanvas();
         addChild(this.dugujiujiantupoCanvas);
         this.dugujiujiantupoCanvas.x = 142;
         this.dugujiujiantupoCanvas.y = 0;
         $mask = new Sprite();
         $mask.mouseEnabled = false;
         addChild($mask);
         $mask.x = 414;
         $mask.y = 0;
         with($mask.graphics)
         {
            beginFill(16711680,0.5);
            drawRect(0,0,280,390);
            endFill();
         }
         this.dugujiujiantupoCanvas.mask = $mask;
         addEventListener(UI_DUGUJIUJIANTIPO_GUANBI_CLICK,this.aa1);
         this.btnYC = new SecondButton();
         this.btnYC.x = 220 - 20;
         this.btnYC.y = 335;
         this.btnYC.label = LanResManager.getLanCommonTextWords("激活隐藏属性");
         this.btnYC.addEventListener(MouseEvent.CLICK,this.onClick);
         addChild(this.btnYC);
         this.jihuoFt = new FTextArea();
         this.jihuoFt.x = this.btnYC.x;
         this.jihuoFt.y = this.btnYC.y + 2;
         this.jihuoFt.htmlText = "<font color = \'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("隐藏属性已激活") + "</font>";
         this.jihuoFt.visible = false;
         addChild(this.jihuoFt);
         this.fts4 = new FTextArea();
         this.fts4.x = 205;
         this.fts4.y = 20;
         this.fts4.textColor = StaticValue.RED;
         this.fts4.width = 170;
         this.fts4.height = 20;
         this.fts4.htmlText = LanResManager.getLanCommonTextWords("独孤九剑真元(未激活)");
         addChild(this.fts4);
         ToolTips.createToolTips(this.fts4,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("已使用") + fts4num + LanResManager.getLanCommonTextWords("个") + "<br>" + LanResManager.getLanCommonTextWords("每使用一个增加攻击+1.000.000防守+1.000.000武功层+1") + "<br>" + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.fts = new FTextArea();
         this.fts.x = 205;
         this.fts.y = 20;
         this.fts.textColor = StaticValue.RED;
         this.fts.width = 170;
         this.fts.height = 20;
         this.fts.htmlText = LanResManager.getLanCommonTextWords("剑气归宗终极属性(未激活)");
         ToolTips.createToolTips(this.fts,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("攻击2888888、防御 2288888、血量388888888、暴击888、闪避888") + " <br>" + LanResManager.getLanCommonTextWords("剑气归宗终极属性：增加人物攻击属性10%、增加人物暴击属性20% 闪避属性30%") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.fts1 = new FTextArea();
         this.fts1.x = 205;
         this.fts1.y = 40;
         this.fts1.textColor = StaticValue.GREEN;
         this.fts1.width = 200;
         this.fts1.height = 20;
         this.fts1.htmlText = LanResManager.getLanCommonTextWords("独孤九剑究极（已激活）");
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
         this.fts2.x = 205;
         this.fts2.y = 40 + 20;
         this.fts2.textColor = StaticValue.GREEN;
         this.fts2.width = 200;
         this.fts2.height = 20;
         this.fts2.htmlText = LanResManager.getLanCommonTextWords("九剑求败心法秘籍（已激活）");
         this.fts2.visible = false;
         addChild(this.fts2);
         ToolTips.createToolTips(this.fts2,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("攻击1500亿、防御1000亿、血量3000亿、暴击18888、闪避18888、所有武功提升20000层") + "<br>" + LanResManager.getLanCommonTextWords("九剑求败（特殊技能）：被攻击时自身将有几率触发九剑求败状态，在此状态下每秒将回复100%血量，并反弹500%的血量伤害给对手，技能效果持续5秒！") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.kuangSpr = new Sprite();
         addChild(this.kuangSpr);
         this.equipContainers = new Sprite();
         this.equipContainers.x = 295 - 288 + 345;
         this.equipContainers.y = 322 - 73 + 1 - 40 - 45 + 30 - 45;
         with(this.equipContainers.graphics)
         {
            beginFill(16711680,0);
            drawRect(0,0,40,40);
            endFill();
         }
         this.equipContainers.addEventListener(MouseEvent.MOUSE_UP,this.onItemClick,false,30);
         i = 0;
         while(i < 2)
         {
            this.kuangHD = StaticValue.getBitmapByClassName("ui.tiem.slot");
            this.kuangHD.x = 10 + 345;
            this.kuangHD.y = 266 - 2 - 1 - 10 - 40 - 45 + 30 - 45 - i * 40;
            i++;
         }
         this.fts3 = new FTextArea();
         this.fts3.x = 205;
         this.fts3.y = 40 + 20 + 20;
         this.fts3.textColor = StaticValue.GREEN;
         this.fts3.width = 200;
         this.fts3.height = 20;
         this.fts3.htmlText = LanResManager.getLanCommonTextWords("独孤九剑秘籍（已激活）");
         this.fts3.visible = false;
         addChild(this.fts3);
         ToolTips.createToolTips(this.fts3,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("特殊属性：攻击 68888亿、防御60888亿、血量80888亿、所有武功提升 880000层 ") + "<br>" + LanResManager.getLanCommonTextWords("独孤九剑：攻击时有几率触发独孤九剑九式合技，总决式 破剑式  破枪式  破鞭式  破索式 破") + "<br>" + LanResManager.getLanCommonTextWords("掌式 破箭式  破气式，持续10秒；在此状态下，自身将破除对手的所有攻击， 且自身每攻击一") + "<br>" + LanResManager.getLanCommonTextWords("次，都将瞬间打断对手的攻击，使对手无法招架；对手每受到一次攻击，身上的所有勋章都将失") + "<br>" + LanResManager.getLanCommonTextWords("效，无法在使用，持续10秒。独孤拥有者：激活独孤九剑秘籍玩家，拥有独孤求败、风清扬、令") + "<br>" + LanResManager.getLanCommonTextWords("狐冲即可使技能的触发几率翻3倍。");
            return _loc1_ + "</font></textformat>";
         });
      }
      
      private function aa1(param1:BaseEvent) : void
      {
         this.onShowLv(false);
      }
      
      public function set $parent(param1:DisplayObject) : void
      {
         this._parent = param1;
         this.dugujiujiantupoCanvas._parent = this;
         this.dugujiujiantupoCanvas._parent2 = param1;
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.djtpBtn:
               this._parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUJIUJIAN_DENGJITUPO_CLICK,"",this.giftList.selectItem.id));
               break;
            case this.btnYC:
               this._parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUJIUJIAN_YINCANGSHUXING_JIHUO_CLICK));
         }
         switch(param1.currentTarget)
         {
            case this.check:
               this._parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUJIUJIAN_EFFECT_SHOW,"",this.check.selectState));
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
         var _loc4_:int = 0;
         while(_loc4_ < this.giftList.selectItem.shuxing.length)
         {
            if((_loc4_ + 1) % 2 == 0 && _loc4_ != 0)
            {
               _loc2_ += this.giftList.selectItem.shuxing[_loc4_] + "<br>";
            }
            else
            {
               _loc3_ += this.giftList.selectItem.shuxing[_loc4_] + "<br>";
            }
            _loc4_++;
         }
         this.shuxingFta1.htmlText = _loc3_;
         this.shuxingFta2.htmlText = _loc2_;
         this.miaoshuFta.htmlText = this.giftList.selectItem.miaoshu;
         if(this.djtpBtnBo)
         {
            if(this.giftList.selectItem.lingwu)
            {
               this.djtpBtn.enabled = false;
            }
            else
            {
               this.djtpBtn.enabled = true;
            }
         }
         if(this.mc_ == -1)
         {
            this.mc_ = this.giftList.selectItem.id;
            this.setMc(this.giftList.selectItem.id);
         }
         else if(this.mc_ != this.giftList.selectItem.id)
         {
            this.setMc(this.giftList.selectItem.id);
            this.mc_ = this.giftList.selectItem.id;
         }
         if(this.giftList.selectItem.dangqian)
         {
            this._parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUJIUJIAN_DENGJITUPO_CLICK,"",this.giftList.selectItem.id));
         }
         else
         {
            this.onShowLv(false);
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
            this.gongMc1.x = 300 - this.gongMc1.width / 2;
            this.gongMc1.y = 110 - this.gongMc1.height / 2;
            addChildAt(this.gongMc1,2);
         }
      }
      
      public function setInitialize(param1:Boolean, param2:Array) : void
      {
         var _loc7_:int = 0;
         this.giftList.dataProvider = param2;
         this.Scroll.update();
         this.shuxingFta1.htmlText = "";
         this.shuxingFta2.htmlText = "";
         this.miaoshuFta.htmlText = "";
         this.djtpBtn.enabled = true;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:String = "";
         var _loc6_:String = "";
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         while(_loc9_ < param2.length)
         {
            if(param2[_loc9_].dangqian)
            {
               _loc8_ = _loc9_;
               _loc5_ = "";
               _loc6_ = "";
               _loc7_ = 0;
               while(_loc7_ < param2[_loc9_].shuxing.length)
               {
                  if((_loc7_ + 1) % 2 == 0 && _loc7_ != 0)
                  {
                     _loc5_ += param2[_loc9_].shuxing[_loc7_] + "<br>";
                  }
                  else
                  {
                     _loc6_ += param2[_loc9_].shuxing[_loc7_] + "<br>";
                  }
                  _loc7_++;
               }
               this.shuxingFta1.htmlText = _loc6_;
               this.shuxingFta2.htmlText = _loc5_;
               this.miaoshuFta.htmlText = param2[_loc9_].miaoshu;
            }
            if(param2[_loc9_].lingwu > 0)
            {
               _loc3_++;
            }
            else
            {
               _loc4_++;
            }
            _loc9_++;
         }
         if(_loc3_ == param2.length)
         {
            _loc5_ = "";
            _loc6_ = "";
            _loc7_ = 0;
            while(_loc7_ < param2[param2.length - 1].shuxing.length)
            {
               if((_loc7_ + 1) % 2 == 0 && _loc7_ != 0)
               {
                  _loc5_ += param2[param2.length - 1].shuxing[_loc7_] + "<br>";
               }
               else
               {
                  _loc6_ += param2[param2.length - 1].shuxing[_loc7_] + "<br>";
               }
               _loc7_++;
            }
            this.shuxingFta1.htmlText = _loc6_;
            this.shuxingFta2.htmlText = _loc5_;
            this.miaoshuFta.htmlText = param2[param2.length - 1].miaoshu;
            _loc8_ = param2.length - 1;
            this.djtpBtn.enabled = false;
         }
         else if(_loc4_ == param2.length)
         {
            _loc5_ = "";
            _loc6_ = "";
            _loc7_ = 0;
            while(_loc7_ < param2[0].shuxing.length)
            {
               if((_loc7_ + 1) % 2 == 0 && _loc7_ != 0)
               {
                  _loc5_ += param2[0].shuxing[_loc7_] + "<br>";
               }
               else
               {
                  _loc6_ += param2[0].shuxing[_loc7_] + "<br>";
               }
               _loc7_++;
            }
            this.shuxingFta1.htmlText = _loc6_;
            this.shuxingFta2.htmlText = _loc5_;
            this.miaoshuFta.htmlText = param2[0].miaoshu;
            _loc8_ = 0;
         }
         this.giftList.setSelectItemByIndex(_loc8_);
         this.Scroll.setScrollPosition(80 * _loc8_);
         this.isMain = param1;
         this.setJiHuoDuGu(param1);
      }
      
      public function setJiHuoDuGu(param1:Boolean) : void
      {
         if(param1)
         {
            this.fts1.visible = GameState.dictMainStatus[SpecialGoodsID.DUGUJIUJIAN_JIUJI_ID];
            this.fts2.visible = GameState.dictMainStatus[SpecialGoodsID.JIUJIAN_JIUBAI_ID];
            this.fts3.visible = GameState.dictMainStatus[SpecialGoodsID.DUGUJIUJIAN_DUGUJIUJIAN_ID];
            this.fts4.visible = GameState.dictMainStatus[SpecialGoodsID.DUGUJIUJIAN_ZHENYUAN_ID];
            this.fts4num = GameState.dictMainStatus[725540];
         }
         else
         {
            this.fts1.visible = GameState.dictTargetStatus[SpecialGoodsID.DUGUJIUJIAN_JIUJI_ID];
            this.fts2.visible = GameState.dictTargetStatus[SpecialGoodsID.JIUJIAN_JIUBAI_ID];
            this.fts3.visible = GameState.dictTargetStatus[SpecialGoodsID.DUGUJIUJIAN_DUGUJIUJIAN_ID];
            this.fts4.visible = GameState.dictTargetStatus[SpecialGoodsID.DUGUJIUJIAN_ZHENYUAN_ID];
            this.fts4num = GameState.dictTargetStatus[725540];
         }
      }
      
      public function set avatar(param1:BitmapData) : void
      {
         this._avatar.bitmapData = param1;
         if(!param1)
         {
            return;
         }
         this._avatar.x = 300 - this._avatar.width / 2;
         this._avatar.y = 150 - this._avatar.height + 20;
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
               this.gongMc1.x = 300 - this.gongMc1.width / 2;
               this.gongMc1.y = 110 - this.gongMc1.height / 2;
               addChildAt(this.gongMc1,2);
            }
         }
         else
         {
            this.loadUrl1 = GameConfig.fileBaseFolder + "res/data/mc/gugu9jian/" + (param1 + 1) + ".swf";
            _loc2_ = [new LoadData(this.loadUrl1,this.com,null,null,"","gongMc" + param1)];
            LoaderManager.load(_loc2_);
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
            if(this.dugujiujiantupoCanvas.x == 142)
            {
               TweenMax.to(this.dugujiujiantupoCanvas,1,{"x":414});
               this.tupoBo = true;
            }
         }
         else if(this.dugujiujiantupoCanvas.x == 414)
         {
            TweenMax.to(this.dugujiujiantupoCanvas,1,{"x":142});
            this.tupoBo = false;
         }
      }
      
      public function setJiujianLingwuInitialize(param1:String, param2:Boolean, param3:String, param4:int, param5:Boolean, param6:int, param7:Boolean, param8:int) : void
      {
         this.dugujiujiantupoCanvas.setInitialize(param1,param2,param3,param4,param5,param6,param7,param8);
      }
      
      public function setJiujianLingwuZhufuzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this.dugujiujiantupoCanvas.setZhufuzhi(param1,param2,param3);
      }
      
      public function setJiujianLingwuGoods(param1:Goods) : void
      {
         this.dugujiujiantupoCanvas.setGoods(param1);
      }
      
      public function setJiujianLingwuShuoming(param1:String) : void
      {
         this.dugujiujiantupoCanvas.setShuoming(param1);
      }
      
      public function setJiujianLingwuBtn(param1:Boolean) : void
      {
         this.dugujiujiantupoCanvas.setBtn(param1);
      }
      
      public function bofangDuguYanhua() : void
      {
         if(Boolean(this.yanhuaMc) && this.yanhuaMc.parent != null)
         {
            this.yanhuaMc.parent.removeChild(this.yanhuaMc);
         }
         LoaderManager.lazyLoad(function(param1:Event):void
         {
            var _loc2_:LoadingItem = param1.target as LoadingItem;
            yanhuaMc = _loc2_.content as MovieClip;
            yanhuaMc.x = 300 - yanhuaMc.width / 2;
            yanhuaMc.y = 100 - yanhuaMc.height / 2;
            addChild(yanhuaMc);
         },null,false,GameConfig.fileBaseFolder + "res/data/mc/wabao.swf");
      }
      
      public function bofangDuguNo10() : void
      {
         if(Boolean(this.no10Mc) && this.no10Mc.parent != null)
         {
            this.no10Mc.parent.removeChild(this.no10Mc);
         }
         LoaderManager.lazyLoad(function(param1:Event):void
         {
            var _loc2_:LoadingItem = param1.target as LoadingItem;
            no10Mc = _loc2_.content as MovieClip;
            no10Mc.x = 0 - 15;
            no10Mc.y = 250;
            addChild(no10Mc);
         },null,false,GameConfig.fileBaseFolder + "res/data/mc/dugujiujian/jihuo10.swf");
      }
      
      public function setJiujianEnabledFun() : void
      {
         this.djtpBtn.enabled = false;
         this.djtpBtnBo = false;
         this.check.enabled = false;
         this.btnYC.enabled = false;
      }
      
      public function setShow(param1:Boolean) : void
      {
         this.check.selectState = param1;
      }
      
      public function setJihuo(param1:Boolean, param2:Boolean) : void
      {
         this.jihuoFt.visible = param1;
         this.btnYC.visible = !param1;
         if(param2)
         {
            this.fts.textColor = StaticValue.GREEN;
            this.fts.htmlText = LanResManager.getLanCommonTextWords("剑气归宗终极属性(已激活)");
         }
         else
         {
            this.fts.textColor = StaticValue.RED;
            this.fts.htmlText = LanResManager.getLanCommonTextWords("剑气归宗终极属性(未激活)");
         }
      }
      
      private function onItemClick(param1:MouseEvent) : void
      {
         if(this.isMain)
         {
            this._parent.dispatchEvent(new BaseEvent(CharAttribute.UI_CHAR_ATTRIBUTE_MENU_SHOW,"",param1));
         }
      }
      
      public function set_DuGuJiuJian(param1:Array) : void
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
            if(_loc3_.res.position == ItemPositionRange.POSTION_DUGUJIUJIAN_LONGHUNJIAN)
            {
               _loc4_.x = 4 + 1;
               _loc4_.y = 4 + 1;
               this.equipContainers.addChild(_loc4_);
            }
            else if(_loc3_.res.position == ItemPositionRange.POSTION_DUGUJIUJIAN_SHOUWEIHUDUN)
            {
               _loc4_.x = 4 + 1;
               _loc4_.y = 4 + 1 - 40;
               this.equipContainers.addChild(_loc4_);
            }
            _loc2_++;
         }
      }
   }
}

