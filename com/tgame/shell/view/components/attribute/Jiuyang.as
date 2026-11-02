package com.tgame.shell.view.components.attribute
{
   import br.com.stimuli.loading.loadingtypes.LoadingItem;
   import com.fireice.checkBox.FCheckBox;
   import com.fireice.list.FList;
   import com.fireice.panel.FCanvas;
   import com.fireice.scroll.FVScorllBar;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameState;
   import com.tgame.common.res.lan.*;
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
   
   public class Jiuyang extends Sprite
   {
      
      public static const UI_DUGUJIUJIANTIPO_GUANBI_CLICKJ:String = "UI_DUGUJIUJIANTIPO_GUANBI_CLICKJ";
      
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
      
      private var dugujiujiantupoCanvas:JiuyangTupoCanvas;
      
      private var yanhuaMc:MovieClip;
      
      public var tupoBo:Boolean = false;
      
      private var zuox:int = 210;
      
      private var youx:int = 190;
      
      private var check:FCheckBox;
      
      private var fc:FCanvas;
      
      private var jihuoFt:FTextArea;
      
      private var btnYC:SecondButton;
      
      private var mc_:int = -1;
      
      private var mcObj:Object;
      
      private var fts1:FTextArea;
      
      private var fts2:FTextArea;
      
      private var fts3:FTextArea;
      
      private var fts4:FTextArea;
      
      private var fts4num:int;
      
      public function Jiuyang()
      {
         var lb:FLabel;
         var $mask:Sprite;
         this.mcObj = {};
         super();
         this.bgImg = new Bitmap();
         this.bgImg.name = "ui.char.jiuyang.bg";
         addChild(this.bgImg);
         this.fc = new FCanvas();
         this.fc.x = 0;
         this.fc.y = 1;
         this.fc.width = 407;
         this.fc.height = 195 + 170;
         this.fc.skin = "box_transparence";
         addChild(this.fc);
         this.fta = new FTextArea();
         with(this.fta)
         {
            filters = StaticValue.filter;
            x = 10 + zuox;
            y = 10;
            textColor = StaticValue.ORANGE;
            autoSize = TextFieldAutoSize.LEFT;
            htmlText = "<font size=\'16\'>" + LanResManager.getLanCommonTextWords("神功万道，纯阳至上") + "</font>";
         }
         addChild(this.fta);
         this.fta = new FTextArea();
         with(this.fta)
         {
            filters = StaticValue.filter;
            width = 190;
            height = 140;
            x = 10 + zuox;
            y = 30;
            wordWrap = true;
            htmlText = "<textformat leading=\'1\'>" + "<font color=\'" + StaticValue.SKY_BLUE_HTML + "\'>" + LanResManager.getLanCommonTextWords("九阳神功为达摩老祖所著的九阳真经演化而成的绝世神功。") + "</font>" + "<font color=\'" + StaticValue.PURPLE50_HTML + "\'>" + LanResManager.getLanCommonTextWords("本神功共分九层，修成之后，内力、体力、防御力均无可匹敌，寻常招式亦能转为攻击力；") + "</font>" + "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("修炼此功需根骨奇佳外，经奇缘点化方可大成。") + "</font>" + "</textformat>";
         }
         addChild(this.fta);
         this._avatar = new Bitmap();
         addChildAt(this._avatar,1);
         this.check = new FCheckBox();
         addChild(this.check);
         this.check.x = 55 - 2 - 2 - 3 + 20;
         this.check.y = 125 + 2 + 70 - 17;
         this.check.addEventListener(MouseEvent.CLICK,this.onClick);
         lb = new FLabel();
         with(lb)
         {
            x = 70 - 2 - 3 + 20;
            y = 125 + 3 + 1 + 70 - 17;
            textColor = StaticValue.GREEN;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("外观显示");
         }
         addChild(lb);
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
         this.giftList.itemRenderer = new DuguJiujianList();
         this.giftList.listWidth = 174;
         this.listContainer.addChild(this.giftList);
         this.giftList.x = 0;
         this.giftList.y = 0;
         this.giftList.addEventListener(MouseEvent.CLICK,this.onListClick);
         this.Scroll = new FVScorllBar(this.listContainer,200);
         addChild(this.Scroll);
         this.Scroll.x = 178 + this.zuox;
         this.Scroll.y = 160;
         this.fta = new FTextArea();
         with(this.fta)
         {
            filters = StaticValue.filter;
            x = 195 - youx;
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
            x = 195 - youx;
            y = 223;
            textColor = StaticValue.YELLOW;
            autoSize = TextFieldAutoSize.LEFT;
            htmlText = "<textformat leading=\'1\'>" + LanResManager.getLanCommonTextWords("加攻击：") + "<br>" + LanResManager.getLanCommonTextWords("加防御：") + "<br>" + LanResManager.getLanCommonTextWords("加生命：") + "<br>" + LanResManager.getLanCommonTextWords("加内力：") + "<br>" + LanResManager.getLanCommonTextWords("加体力：") + "</textformat>";
         }
         addChild(this.fta);
         this.shuxingFta1 = new FTextArea();
         with(this.shuxingFta1)
         {
            filters = StaticValue.filter;
            x = 250 - youx;
            y = 223;
            textColor = StaticValue.YELLOW;
            autoSize = TextFieldAutoSize.LEFT;
            htmlText = "";
         }
         addChild(this.shuxingFta1);
         this.miaoshuFta = new FTextArea();
         with(this.miaoshuFta)
         {
            filters = StaticValue.filter;
            x = 198 - youx;
            y = 276 + 27;
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
         this.djtpBtn.x = 330 - 135 - this.youx + 95;
         this.djtpBtn.y = 340;
         this.djtpBtn.addEventListener(MouseEvent.MOUSE_UP,this.onClick);
         this.dugujiujiantupoCanvas = new JiuyangTupoCanvas();
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
         addEventListener(UI_DUGUJIUJIANTIPO_GUANBI_CLICKJ,this.aa1);
         this.btnYC = new SecondButton();
         this.btnYC.x = this.djtpBtn.x + 100 - 75;
         this.btnYC.y = 340 - 58;
         this.btnYC.label = LanResManager.getLanCommonTextWords("激活隐藏属性");
         this.btnYC.addEventListener(MouseEvent.CLICK,this.onClick);
         addChild(this.btnYC);
         this.jihuoFt = new FTextArea();
         this.jihuoFt.x = this.btnYC.x;
         this.jihuoFt.y = this.btnYC.y + 2;
         this.jihuoFt.htmlText = "<font color = \'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("隐藏属性已激活") + "</font>";
         this.jihuoFt.visible = false;
         addChild(this.jihuoFt);
         this.fts1 = new FTextArea();
         this.fts1.x = 10;
         this.fts1.y = 7;
         this.fts1.textColor = StaticValue.RED;
         this.fts1.width = 170;
         this.fts1.height = 20;
         ToolTips.createToolTips(this.fts1,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("攻击28888888、防御16888888、血量488888888、暴击888、闪避888、所有武功提升十二层、攻击属性提升20%") + "<br>" + LanResManager.getLanCommonTextWords("特殊效果：九阳雷神护体加身，超强效果抵抗朱雀神力，必定减免80%反伤伤害！") + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.fts4 = new FTextArea();
         this.fts4.x = 10;
         this.fts4.y = 7;
         this.fts4.textColor = StaticValue.RED;
         this.fts4.width = 170;
         this.fts4.height = 20;
         this.fts4.htmlText = LanResManager.getLanCommonTextWords("九阳神功真元（已激活）");
         addChild(this.fts4);
         ToolTips.createToolTips(this.fts4,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("已使用") + fts4num + LanResManager.getLanCommonTextWords("个") + "<br>" + LanResManager.getLanCommonTextWords("每使用一个增加攻击+1.000.000防守+1.000.000武功层+1") + "<br>";
            return _loc1_ + "</font></textformat>";
         });
         this.fts2 = new FTextArea();
         this.fts2.x = 10;
         this.fts2.y = 22;
         this.fts2.textColor = StaticValue.GREEN;
         this.fts2.width = 200;
         this.fts2.height = 20;
         this.fts2.htmlText = LanResManager.getLanCommonTextWords("九阳神功究极激活秘籍（已激活）");
         this.fts2.visible = true;
         addChild(this.fts2);
         ToolTips.createToolTips(this.fts2,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("攻击2088888888 防御1688888888 暴击2888 闪避2888血量2088888888、所有武功提升2180层") + "<br>";
            return _loc1_ + "</font></textformat>";
         });
         this.fts3 = new FTextArea();
         this.fts3.x = 10;
         this.fts3.y = 22 + 15;
         this.fts3.textColor = StaticValue.GREEN;
         this.fts3.width = 200;
         this.fts3.height = 20;
         this.fts3.htmlText = LanResManager.getLanCommonTextWords("九阳天尊心法秘籍（已激活）");
         this.fts3.visible = false;
         addChild(this.fts3);
         ToolTips.createToolTips(this.fts3,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("攻击1500亿、防御1000亿、血量3000亿、暴击18888、闪避18888、所有武功提升20000层") + "<br>" + LanResManager.getLanCommonTextWords("九阳天尊（特殊技能）：攻击时有几率触发令对手命中九阳天尊，对手在此状态下将每秒降低10000层武功，技能效果持续10秒！") + "<br>";
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
               this._parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUJIUJIAN_DENGJITUPO_CLICKJ,"",this.giftList.selectItem.id));
               break;
            case this.btnYC:
               this._parent.dispatchEvent(new BaseEvent(CharAttribute.UI_JIUYANG_YINCANGSHUXING_JIHUO_CLICK));
         }
         switch(param1.currentTarget)
         {
            case this.check:
               this._parent.dispatchEvent(new BaseEvent(CharAttribute.UI_JIUYANGSHENGONG_EFFECT_SHOW,"",this.check.selectState));
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
         _loc2_ += "<textformat leading=\'1\'>";
         var _loc4_:int = 0;
         while(_loc4_ < this.giftList.selectItem.shuxing.length)
         {
            _loc2_ += this.giftList.selectItem.shuxing[_loc4_] + "<br>";
            _loc4_++;
         }
         _loc2_ += "</textformat>";
         this.shuxingFta1.htmlText = _loc2_;
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
            this._parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUJIUJIAN_DENGJITUPO_CLICKJ,"",this.giftList.selectItem.id));
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
            this.gongMc1.x = 300 - this.gongMc1.width / 2 - this.youx - 5;
            this.gongMc1.y = 110 - this.gongMc1.height / 2 + 7;
            addChildAt(this.gongMc1,2);
         }
      }
      
      public function setInitialize(param1:Boolean, param2:Array) : void
      {
         var _loc7_:int = 0;
         this.giftList.dataProvider = param2;
         this.Scroll.update();
         this.shuxingFta1.htmlText = "";
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
               _loc5_ += "<textformat leading=\'1\'>";
               _loc7_ = 0;
               while(_loc7_ < param2[_loc9_].shuxing.length)
               {
                  _loc5_ += param2[_loc9_].shuxing[_loc7_] + "<br>";
                  _loc7_++;
               }
               _loc5_ += "</textformat>";
               this.shuxingFta1.htmlText = _loc5_;
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
         if(_loc3_ == 9)
         {
            _loc5_ = "";
            _loc6_ = "";
            _loc5_ += "<textformat leading=\'1\'>";
            _loc7_ = 0;
            while(_loc7_ < param2[param2.length - 1].shuxing.length)
            {
               _loc5_ += param2[param2.length - 1].shuxing[_loc7_] + "<br>";
               _loc7_++;
            }
            _loc5_ += "</textformat>";
            this.shuxingFta1.htmlText = _loc5_;
            this.miaoshuFta.htmlText = param2[param2.length - 1].miaoshu;
            _loc8_ = param2.length - 1;
            this.djtpBtn.enabled = false;
         }
         else if(_loc4_ == 9)
         {
            _loc5_ = "";
            _loc6_ = "";
            _loc5_ += "<textformat leading=\'1\'>";
            _loc7_ = 0;
            while(_loc7_ < param2[0].shuxing.length)
            {
               _loc5_ += param2[0].shuxing[_loc7_] + "<br>";
               _loc7_++;
            }
            _loc5_ += "</textformat>";
            this.shuxingFta1.htmlText = _loc5_;
            this.miaoshuFta.htmlText = param2[0].miaoshu;
            _loc8_ = 0;
         }
         this.giftList.setSelectItemByIndex(_loc8_);
         this.Scroll.setScrollPosition(80 * _loc8_);
         this.setJiHuoJiuyang(param1);
      }
      
      public function setJiHuoJiuyang(param1:Boolean) : void
      {
         if(param1)
         {
            this.fts2.visible = GameState.dictMainStatus[SpecialGoodsID.JIUYANGSHENGONG_JIUJI_ID];
            this.fts3.visible = GameState.dictMainStatus[SpecialGoodsID.JIUYANG_TIANZHUN_ID];
            this.fts4.visible = GameState.dictMainStatus[SpecialGoodsID.JIUYANGSHENGONG_ZHENYUAN_ID];
            this.fts4num = GameState.dictMainStatus[725542];
         }
         else
         {
            this.fts2.visible = GameState.dictTargetStatus[SpecialGoodsID.JIUYANGSHENGONG_JIUJI_ID];
            this.fts3.visible = GameState.dictTargetStatus[SpecialGoodsID.JIUYANG_TIANZHUN_ID];
            this.fts4.visible = GameState.dictTargetStatus[SpecialGoodsID.JIUYANGSHENGONG_ZHENYUAN_ID];
            this.fts4num = GameState.dictTargetStatus[725542];
         }
      }
      
      public function set avatar(param1:BitmapData) : void
      {
         this._avatar.bitmapData = param1;
         if(!param1)
         {
            return;
         }
         this._avatar.x = 300 - this._avatar.width / 2 - this.youx - 7;
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
               this.gongMc1.x = 300 - this.gongMc1.width / 2 - this.youx - 5;
               this.gongMc1.y = 110 - this.gongMc1.height / 2 + 7;
               addChildAt(this.gongMc1,2);
            }
         }
         else
         {
            this.loadUrl1 = GameConfig.fileBaseFolder + "res/data/mc/jiuyangshengong/" + (param1 + 1) + ".swf";
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
      
      public function setJihuo(param1:Boolean) : void
      {
         this.jihuoFt.visible = param1;
         this.btnYC.visible = !param1;
      }
      
      public function setJihuo2(param1:Boolean) : void
      {
         if(param1)
         {
            this.fts1.textColor = StaticValue.GREEN;
            this.fts1.htmlText = LanResManager.getLanCommonTextWords("九阳雷神护体(已激活)");
         }
         else
         {
            this.fts1.textColor = StaticValue.RED;
            this.fts1.htmlText = LanResManager.getLanCommonTextWords("九阳雷神护体(未激活)");
         }
      }
   }
}

