package com.tgame.shell.view.components
{
   import com.fireice.alert.FAlert;
   import com.fireice.button.FButton;
   import com.fireice.button.FSimpleButton;
   import com.fireice.checkBox.FCheckBox;
   import com.fireice.event.FAlertEvent;
   import com.fireice.event.FCloseEvent;
   import com.fireice.list.FList;
   import com.fireice.panel.FCanvas;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.F9GridBitmap;
   import com.fireice.util.FLoader;
   import com.fireice.util.Tools;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.GameState;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.ItemPositionRange;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.LoadBuffer;
   import com.tgame.common.ui.componets.POPWindowManager;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.common.ui.componets.SmallLoadingBar;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.utils.ToolTips;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.NumberFormatter;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.timer.helper.TimerHelper;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   
   public class LongWenKeHuaPanel extends FPanel
   {
      
      private static var biaoshiStr1:Array = ["","×10"];
      
      private static var biaoshiStr2:Array = ["","×2"];
      
      public static const UI_QINGCHULONGWEN_CLICK:String = "UI_QINGCHULONGWEN_CLICK";
      
      public static const UI_LONGWENKEHUA_CLICK:String = "UI_LONGWENKEHUA_CLICK";
      
      public static const UI_GETZHUANGBEIINFO:String = "UI_GETZHUANGBEIINFO";
      
      private var equipContainer:Sprite;
      
      private var curSelectItem:ItemFace;
      
      private var ItemArr:Array;
      
      private var chuncui:int;
      
      private var taozhuangchuncui:int;
      
      private var jinpiao:int;
      
      private var chenggonglv:int;
      
      private var count:int;
      
      private var chuncuiText:FTextArea;
      
      private var taozhuangchuncuiText:FTextArea;
      
      private var xiaohaojinpiaoText:FTextArea;
      
      private var yongyoujinpiaoText:FTextArea;
      
      private var chenggonglvText:FTextArea;
      
      private var btnQingchu:SecondButton;
      
      private var btnKehua:SecondButton;
      
      private var kuaijieKehua:SecondButton;
      
      private var kuaiJieSp:JinDuSprite;
      
      private var listContainer:FCanvas;
      
      private var selectBtn:FSimpleButton;
      
      private var selectList:FList;
      
      private var checkbox:FCheckBox;
      
      public var istishi:Boolean = true;
      
      private var jindu1:JinDuSprite;
      
      private var jindu2:JinDuSprite;
      
      private var jindu3:JinDuSprite;
      
      private var jindu4:JinDuSprite;
      
      private var jindu5:JinDuSprite;
      
      private var jindu6:JinDuSprite;
      
      private var jindu7:JinDuSprite;
      
      private var jindu8:JinDuSprite;
      
      private var jindu9:JinDuSprite;
      
      private var jindu10:JinDuSprite;
      
      private var jinduArr:Array;
      
      private var longWenKeHuaTipCanvas:LongWenKeHuaTipCanvas;
      
      private var isKuaijieING:Boolean;
      
      private var yanse:Array;
      
      private var chuncuikehuaIMG:DisplayObject;
      
      private var fts1:FTextArea;
      
      private var longwenzhu:int = 0;
      
      private var _loadBuffer:LoadBuffer;
      
      public function LongWenKeHuaPanel()
      {
         var bg:DisplayObject;
         var img:Bitmap;
         var bg1:F9GridBitmap;
         var arr:Array;
         var i:int;
         var t:FTextArea = null;
         var sp:JinDuSprite = null;
         var obj:Object = null;
         this.jinduArr = [];
         this.yanse = ["hong","cheng","huang","lv","qing","lan","zi"];
         super();
         skin = "panel";
         dragAble = true;
         showCloseButton = true;
         width = 502;
         height = 412;
         titleText = LanResManager.getLanCommonTextWords("龙纹刻画");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         bg = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/longwenkehua/bg.jpg",486,366);
         bg.x = 10;
         bg.y = 2;
         addChild(bg);
         t = new FTextArea();
         t.text = LanResManager.getLanCommonTextWords("龙纹刻画进度");
         t.filters = StaticValue.filter;
         t.textColor = StaticValue.ORANGE;
         t.x = 275;
         t.y = 10;
         addChild(t);
         this.chuncuikehuaIMG = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/longwenkehua/chuncui.png",67,20);
         this.chuncuikehuaIMG.x = 277;
         this.chuncuikehuaIMG.y = 30;
         this.chuncuikehuaIMG.filters = StaticValue.grayFilters;
         addChild(this.chuncuikehuaIMG);
         ToolTips.createToolTips(this.chuncuikehuaIMG,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'><font color=\'StaticValue.WHITE_HTML\'>";
            _loc1_ += LanResManager.getLanCommonTextWords("当装备上所有宝石颜色一致时将激活纯粹刻纹效果") + "<br>" + LanResManager.getLanCommonTextWords("纯粹刻纹效果将使本件装备的纯粹伤害数值*10");
            return _loc1_ + "</textformat>";
         });
         t = new FTextArea();
         t.text = LanResManager.getLanCommonTextWords("点击选中装备");
         t.height = t.textHeight;
         t.width = t.textWidth + 10;
         t.filters = StaticValue.filter;
         t.textColor = StaticValue.SKY_BLUE;
         t.x = 30;
         t.y = 10;
         addChild(t);
         this.jindu1 = new JinDuSprite();
         this.jindu1.x = 181;
         this.jindu1.y = 63;
         addChild(this.jindu1);
         this.jinduArr.push(this.jindu1);
         this.jindu2 = new JinDuSprite();
         this.jindu2.x = 222;
         this.jindu2.y = 54;
         addChild(this.jindu2);
         this.jinduArr.push(this.jindu2);
         this.jindu3 = new JinDuSprite();
         this.jindu3.x = 222;
         this.jindu3.y = 84;
         addChild(this.jindu3);
         this.jinduArr.push(this.jindu3);
         this.jindu4 = new JinDuSprite();
         this.jindu4.x = 204;
         this.jindu4.y = 119;
         addChild(this.jindu4);
         this.jinduArr.push(this.jindu4);
         this.jindu5 = new JinDuSprite();
         this.jindu5.x = 248;
         this.jindu5.y = 102;
         addChild(this.jindu5);
         this.jinduArr.push(this.jindu5);
         this.jindu6 = new JinDuSprite();
         this.jindu6.x = 279;
         this.jindu6.y = 71;
         addChild(this.jindu6);
         this.jinduArr.push(this.jindu6);
         this.jindu7 = new JinDuSprite();
         this.jindu7.x = 327;
         this.jindu7.y = 68;
         addChild(this.jindu7);
         this.jinduArr.push(this.jindu7);
         this.jindu8 = new JinDuSprite();
         this.jindu8.x = 356;
         this.jindu8.y = 100;
         addChild(this.jindu8);
         this.jinduArr.push(this.jindu8);
         this.jindu9 = new JinDuSprite();
         this.jindu9.x = 396;
         this.jindu9.y = 123;
         addChild(this.jindu9);
         this.jinduArr.push(this.jindu9);
         this.jindu10 = new JinDuSprite();
         this.jindu10.x = 421;
         this.jindu10.y = 85;
         addChild(this.jindu10);
         this.jinduArr.push(this.jindu10);
         this.equipContainer = new Sprite();
         this.equipContainer.x = 10;
         this.equipContainer.y = 10;
         addChild(this.equipContainer);
         this.chuncuiText = new FTextArea();
         this.chuncuiText.htmlText = LanResManager.getLanCommonTextWords("单件纯粹伤害");
         this.chuncuiText.textColor = StaticValue.GREEN;
         this.chuncuiText.filters = StaticValue.filter;
         this.chuncuiText.x = 132;
         this.chuncuiText.y = 160;
         addChild(this.chuncuiText);
         this.taozhuangchuncuiText = new FTextArea();
         this.taozhuangchuncuiText.htmlText = LanResManager.getLanCommonTextWords("套装纯粹伤害");
         this.taozhuangchuncuiText.textColor = StaticValue.GREEN;
         this.taozhuangchuncuiText.filters = StaticValue.filter;
         this.taozhuangchuncuiText.x = 132;
         this.taozhuangchuncuiText.y = 194;
         addChild(this.taozhuangchuncuiText);
         img = StaticValue.getBitmapByClassName("ui.ico.money.jinpiao");
         addChild(img);
         img.x = 249;
         img.y = 161;
         img = StaticValue.getBitmapByClassName("ui.ico.money.jinpiao");
         addChild(img);
         img.x = 249;
         img.y = 186;
         this.xiaohaojinpiaoText = new FTextArea();
         this.xiaohaojinpiaoText.width = 150;
         this.xiaohaojinpiaoText.text = LanResManager.getLanCommonTextWords("消耗");
         this.xiaohaojinpiaoText.filters = StaticValue.filter;
         this.xiaohaojinpiaoText.textColor = StaticValue.ORANGE;
         this.xiaohaojinpiaoText.x = 214 + 8;
         this.xiaohaojinpiaoText.y = 160;
         addChild(this.xiaohaojinpiaoText);
         this.yongyoujinpiaoText = new FTextArea();
         this.yongyoujinpiaoText.width = 150;
         this.yongyoujinpiaoText.text = LanResManager.getLanCommonTextWords("拥有");
         this.yongyoujinpiaoText.filters = StaticValue.filter;
         this.yongyoujinpiaoText.textColor = StaticValue.ORANGE;
         this.yongyoujinpiaoText.x = 214 + 8;
         this.yongyoujinpiaoText.y = 183;
         addChild(this.yongyoujinpiaoText);
         this.chenggonglvText = new FTextArea();
         this.chenggonglvText.htmlText = LanResManager.getLanCommonTextWords("成功率");
         this.chenggonglvText.filters = StaticValue.filter;
         this.chenggonglvText.textColor = StaticValue.YELLOW;
         this.chenggonglvText.x = 367;
         this.chenggonglvText.y = 162;
         addChild(this.chenggonglvText);
         this.checkbox = new FCheckBox();
         this.checkbox.x = 367;
         this.checkbox.y = 186;
         t = new FTextArea();
         t.text = LanResManager.getLanCommonTextWords("10元宝+10%成功率");
         t.filters = StaticValue.filter;
         t.textColor = StaticValue.YELLOW;
         t.x = 384;
         t.y = 186;
         this.btnQingchu = new SecondButton();
         this.btnQingchu.label = LanResManager.getLanCommonTextWords("清除龙纹");
         this.btnQingchu.x = 220;
         this.btnQingchu.y = 209;
         addChild(this.btnQingchu);
         this.btnQingchu.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("使用元宝可消除已刻画进度最") + "<br>" + LanResManager.getLanCommonTextWords("前方一格的龙纹，消除龙纹所") + "<br>" + LanResManager.getLanCommonTextWords("需的元宝数将随消除次数逐渐") + "<br>" + LanResManager.getLanCommonTextWords("增多，每日凌晨00:00时消除") + "<br>" + LanResManager.getLanCommonTextWords("次数将重置为0") + "</font>";
         this.btnQingchu.addEventListener(MouseEvent.CLICK,this.btnClick);
         this.btnKehua = new SecondButton();
         this.btnKehua.label = LanResManager.getLanCommonTextWords("龙纹刻画");
         this.btnKehua.x = 290 - 10;
         this.btnKehua.y = 209;
         addChild(this.btnKehua);
         this.btnKehua.addEventListener(MouseEvent.CLICK,this.btnClick);
         this.kuaijieKehua = new SecondButton();
         this.kuaijieKehua.label = LanResManager.getLanCommonTextWords("快捷刻画");
         this.kuaijieKehua.x = 360 - 10;
         this.kuaijieKehua.y = 209;
         addChild(this.kuaijieKehua);
         this.kuaijieKehua.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("刻画成功获得龙纹为非选中龙纹时，系统会自动清除并继续刻画。") + "<br>" + LanResManager.getLanCommonTextWords("自动清除龙纹将扣除元宝，扣除元宝的数量将随消除次数逐渐增") + "<br>" + LanResManager.getLanCommonTextWords("多。每次凌晨0点消除次数将重置为0。") + "</font>";
         this.kuaijieKehua.addEventListener(MouseEvent.CLICK,this.btnClick);
         t = new FTextArea();
         t.htmlText = "<textformat leading=\'4\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("龙纹刻画说明：") + "</font><br>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("1.只有装备在身上的200级装备可进行龙纹刻画") + "</font><br>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("2.龙纹刻画将为装备增加一条纯粹伤害属性，当玩家进行任意攻击") + "</font><br>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("时，无论是否命中对方（包括跳闪），均可对目标造成额外的纯粹") + "</font><br>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("伤害，纯粹伤害不会受到任何防御及减伤效果的减免") + "</font><br>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("3.当全部装备所刻画龙纹均为同一色彩时，可激活华丽装备特效，") + "</font><br>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("并将套件纯粹伤害提升至200%") + "</font><br>" + "</textformat>";
         t.width = t.textWidth + 10;
         t.height = t.textHeight + 20;
         t.x = 133;
         t.y = 239;
         addChild(t);
         bg1 = Tools.get9GridBitmpByName("inputBg");
         addChild(bg1);
         bg1.x = 430;
         bg1.y = 205;
         bg1.width = 30;
         bg1.height = 30;
         this.kuaiJieSp = new JinDuSprite();
         this.kuaiJieSp.setImg(this.yanse[0]);
         this.kuaiJieSp.x = bg1.x + 2;
         this.kuaiJieSp.y = bg1.y + 2;
         addChild(this.kuaiJieSp);
         arr = [];
         i = 0;
         while(i < this.yanse.length)
         {
            sp = new JinDuSprite();
            sp.setImg(this.yanse[i]);
            obj = new Object();
            obj = {
               "label":sp,
               "id":i
            };
            arr.push(obj);
            i++;
         }
         this.selectBtn = new FSimpleButton();
         this.selectBtn.skin = "bottomButton";
         addChild(this.selectBtn);
         this.selectBtn.x = bg1.x + bg1.width;
         this.selectBtn.y = 214;
         this.selectBtn.addEventListener(MouseEvent.CLICK,this.showSelectList);
         this.listContainer = new FCanvas();
         this.listContainer.skin = "backGroud";
         this.listContainer.width = 40;
         this.listContainer.height = 210;
         this.listContainer.x = 430;
         this.listContainer.y = 234;
         addChild(this.listContainer);
         this.listContainer.visible = false;
         this.selectList = new FList();
         this.selectList.skin = "list";
         this.selectList.listWidth = 40;
         this.selectList.itemRenderer = new longWenKeHuaListRender();
         this.selectList.dataProvider = arr;
         this.listContainer.addChild(this.selectList);
         this.selectList.setSelectItemByIndex(0);
         this.selectList.addEventListener(MouseEvent.CLICK,this.onSelect);
         this.fts1 = new FTextArea();
         this.fts1.x = 265 + 166;
         this.fts1.y = 30;
         this.fts1.textColor = StaticValue.GREEN;
         this.fts1.width = 170;
         this.fts1.height = 20;
         this.fts1.htmlText = LanResManager.getLanCommonTextWords("龙纹宝珠");
         this.fts1.visible = false;
         addChild(this.fts1);
         ToolTips.createToolTips(this.fts1,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("当前已经使用") + longwenzhu + LanResManager.getLanCommonTextWords("颗龙纹珠，每颗都可以为自身减免1亿血量伤害，并提升1000层武功和10亿攻击，使用上限1000颗。") + "<br>";
            return _loc1_ + "</textformat>";
         });
      }
      
      private function showSelectList(param1:MouseEvent) : void
      {
         this.listContainer.visible = !this.listContainer.visible;
      }
      
      private function onSelect(param1:MouseEvent) : void
      {
         this.kuaiJieSp.setImg(this.yanse[this.selectList.selectItem.id]);
         this.listContainer.visible = false;
      }
      
      private function btnClick(param1:MouseEvent) : void
      {
         var str:String = null;
         var e:MouseEvent = param1;
         var btn:FButton = e.target as FButton;
         switch(btn.label)
         {
            case LanResManager.getLanCommonTextWords("清除龙纹"):
               if(this.istishi)
               {
                  this.longWenKeHuaTipCanvas = new LongWenKeHuaTipCanvas(this.count,this.curSelectItem);
                  this.longWenKeHuaTipCanvas.$parent = this;
                  this.longWenKeHuaTipCanvas.updata(this.count);
                  POPWindowManager.showWindow(this.longWenKeHuaTipCanvas);
               }
               else
               {
                  dispatchEvent(new BaseEvent(UI_QINGCHULONGWEN_CLICK,"",{
                     "id":int(this.curSelectItem.name),
                     "biaoshi":0
                  }));
               }
               break;
            case LanResManager.getLanCommonTextWords("龙纹刻画"):
               dispatchEvent(new BaseEvent(UI_LONGWENKEHUA_CLICK,"",{
                  "id":int(this.curSelectItem.name),
                  "biaoshi":int(this.checkbox.selectState),
                  "shifoukuaijie":0
               }));
               break;
            case LanResManager.getLanCommonTextWords("快捷刻画"):
               str = "";
               str = "<textformat leading=\'\'>" + "<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("快捷刻画中自动清除龙纹功能将扣除") + "<br></font>" + "<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("元宝，扣除的金额和清除龙纹价格相") + "<br></font>" + "<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("等，请问玩家是否自动清除。") + "<br></font>" + "</textformat>";
               FAlert.okLabel = LanResManager.getLanCommonTextWords("确定");
               FAlert.cancelLabel = LanResManager.getLanCommonTextWords("取消");
               FAlert.show(str,"",2,function(param1:FAlertEvent):void
               {
                  if(param1.eventData == FAlert.OK)
                  {
                     isKuaijieING = true;
                     kuaijieKehua.label = LanResManager.getLanCommonTextWords("停止刻画");
                     dispatchEvent(new BaseEvent(UI_LONGWENKEHUA_CLICK,"",{
                        "id":int(curSelectItem.name),
                        "biaoshi":int(checkbox.selectState),
                        "shifoukuaijie":1,
                        "kuaijieID":int(selectList.selectItem.id)
                     }));
                  }
               });
               break;
            case LanResManager.getLanCommonTextWords("停止刻画"):
               this.kuaijieKehua.label = LanResManager.getLanCommonTextWords("快捷刻画");
               this.isKuaijieING = false;
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         var _loc3_:ItemFace = null;
         var _loc2_:ItemFace = param1.target as ItemFace;
         if((_loc2_.getBaseItem() as Goods).res.limit_grade >= 200 && _loc2_ != this.curSelectItem)
         {
            for each(_loc3_ in this.ItemArr)
            {
               _loc3_.showKungFuFram = false;
            }
            _loc2_.showKungFuFram = true;
            this.curSelectItem = _loc2_;
            dispatchEvent(new BaseEvent(UI_GETZHUANGBEIINFO,"",{"id":int(this.curSelectItem.name)}));
         }
      }
      
      private function onClose(param1:FCloseEvent = null) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      public function showItem(param1:*) : void
      {
         var value:Array;
         var goods:Goods = null;
         var item:ItemFace = null;
         var isok:Boolean = false;
         var _type:* = param1;
         var help:Function = function():void
         {
            var _loc1_:ItemFace = null;
            curSelectItem = null;
            var _loc2_:Goods = GameInstance.mainCharData.goodsInfo.getGoodsByPosition(ItemPositionRange.POSTION_WUQI);
            if(Boolean(_loc2_) && _loc2_.res.limit_grade >= 200)
            {
               for each(_loc1_ in ItemArr)
               {
                  if(int(_loc1_.name) == _loc2_.position)
                  {
                     _loc1_.showKungFuFram = true;
                     curSelectItem = _loc1_;
                     break;
                  }
               }
            }
            if(!curSelectItem)
            {
               for each(_loc1_ in ItemArr)
               {
                  if((_loc1_.getBaseItem() as Goods).res.limit_grade >= 200)
                  {
                     _loc1_.showKungFuFram = true;
                     curSelectItem = _loc1_;
                     break;
                  }
               }
            }
            if(curSelectItem)
            {
               dispatchEvent(new BaseEvent(UI_GETZHUANGBEIINFO,"",{"id":int(curSelectItem.name)}));
            }
         };
         while(this.equipContainer.numChildren > 0)
         {
            this.equipContainer.removeChildAt(0);
         }
         this.ItemArr = [];
         value = GameInstance.mainCharData.goodsInfo.goodsBodyArr;
         for each(goods in value)
         {
            switch(goods.res.position)
            {
               case ItemPositionRange.POSTION_WUQI:
                  item = new ItemFace(goods);
                  item.x = 19;
                  item.y = 29;
                  break;
               case ItemPositionRange.POSTION_QIBING:
                  item = new ItemFace(goods);
                  item.x = 19;
                  item.y = 82;
                  break;
               case ItemPositionRange.POSTION_YIFU:
                  item = new ItemFace(goods);
                  item.x = 19;
                  item.y = 135;
                  break;
               case ItemPositionRange.POSTION_HUSHOU:
                  item = new ItemFace(goods);
                  item.x = 19;
                  item.y = 188;
                  break;
               case ItemPositionRange.POSTION_HUYAO:
                  item = new ItemFace(goods);
                  item.x = 19;
                  item.y = 241;
                  break;
               case ItemPositionRange.POSTION_HUXUE:
                  item = new ItemFace(goods);
                  item.x = 19;
                  item.y = 294;
                  break;
               case ItemPositionRange.POSTION_TOUSHI:
                  item = new ItemFace(goods);
                  item.x = 67;
                  item.y = 29;
                  break;
               case ItemPositionRange.POSTION_XIANGLIAN:
                  item = new ItemFace(goods);
                  item.x = 67;
                  item.y = 82;
                  break;
               case ItemPositionRange.POSTION_JIEZHI:
                  item = new ItemFace(goods);
                  item.x = 67;
                  item.y = 135;
                  break;
               case ItemPositionRange.POSTION_SHOUZHUO:
                  item = new ItemFace(goods);
                  item.x = 67;
                  item.y = 188;
                  break;
               case ItemPositionRange.POSTION_YAOZHUI:
                  item = new ItemFace(goods);
                  item.x = 67;
                  item.y = 241;
                  break;
               case ItemPositionRange.POSTION_PIFENG:
                  item = new ItemFace(goods);
                  item.x = 67;
                  item.y = 294;
            }
            if(item)
            {
               item.name = String((item.getBaseItem() as Goods).position);
               if((item.getBaseItem() as Goods).res.limit_grade < 200)
               {
                  item.filters = StaticValue.grayFilters;
               }
               this.equipContainer.addChild(item);
               item.addEventListener(MouseEvent.CLICK,this.onClick);
               this.ItemArr.push(item);
            }
         }
         if(_type == 0)
         {
            help();
         }
         else
         {
            isok = false;
            for each(item in this.ItemArr)
            {
               if(this.curSelectItem)
               {
                  if(item.name == this.curSelectItem.name)
                  {
                     isok = true;
                     item.showKungFuFram = true;
                  }
               }
            }
            if(!isok)
            {
               help();
            }
         }
      }
      
      public function updateInfo(param1:int, param2:int, param3:Array, param4:int, param5:int, param6:Number, param7:int, param8:int, param9:int, param10:int, param11:int) : void
      {
         var callback2:Function;
         var i:int = 0;
         var weizhi:int = param1;
         var len:int = param2;
         var arr:Array = param3;
         var chuncui:int = param4;
         var chuncuibeishu:int = param5;
         var taochuncui:Number = param6;
         var taochuncuibeishu:int = param7;
         var jinpiao:int = param8;
         var chenggonglv:int = param9;
         var qingchu:int = param10;
         var isShouDongQingchu:int = param11;
         this.longwenzhu = GameState.dictMainStatus[SpecialGoodsID.LONGWENKEHUA_LONGWENZHU_ID];
         i = 0;
         while(i < this.jinduArr.length)
         {
            (this.jinduArr[i] as JinDuSprite).clear();
            i++;
         }
         i = 0;
         while(i < arr.length)
         {
            (this.jinduArr[i] as JinDuSprite).setImg(this.yanse[arr[i]]);
            i++;
         }
         this.chuncuiText.htmlText = LanResManager.getLanCommonTextWords("单件纯粹伤害") + "<br>" + chuncui + biaoshiStr1[chuncuibeishu];
         this.taozhuangchuncuiText.htmlText = LanResManager.getLanCommonTextWords("套装纯粹伤害") + "<br>" + taochuncui + biaoshiStr2[taochuncuibeishu];
         this.xiaohaojinpiaoText.htmlText = LanResManager.getLanCommonTextWords("消耗") + "          " + NumberFormatter.formatThousands(jinpiao);
         this.yongyoujinpiaoText.htmlText = LanResManager.getLanCommonTextWords("拥有") + "           " + NumberFormatter.formatThousands(GameInstance.mainCharData.moneyInfo.jinpiao);
         this.chenggonglvText.htmlText = LanResManager.getLanCommonTextWords("成功率") + "  " + chenggonglv / 100 + "%";
         this.count = qingchu;
         if(arr.length == 10 && arr[0] == arr[1] && arr[0] == arr[2] && arr[0] == arr[3] && arr[0] == arr[4] && arr[0] == arr[5] && arr[0] == arr[6] && arr[0] == arr[7] && arr[0] == arr[8] && arr[0] == arr[9])
         {
            this.chuncuikehuaIMG.filters = null;
         }
         else
         {
            this.chuncuikehuaIMG.filters = StaticValue.grayFilters;
         }
         if(this.isKuaijieING)
         {
            callback2 = function():void
            {
               dispatchEvent(new BaseEvent(UI_LONGWENKEHUA_CLICK,"",{
                  "id":int(curSelectItem.name),
                  "biaoshi":int(checkbox.selectState),
                  "shifoukuaijie":1,
                  "kuaijieID":int(selectList.selectItem.id)
               }));
            };
            if(isShouDongQingchu == 0)
            {
               if(arr.length == 0)
               {
                  TimerHelper.addDelayCallBack(200,callback2);
               }
               else if(arr.length > 0)
               {
                  if(arr[arr.length - 1] == int(this.selectList.selectItem.id))
                  {
                     this.kuaijieKehua.label = LanResManager.getLanCommonTextWords("快捷刻画");
                     this.isKuaijieING = false;
                  }
                  else
                  {
                     dispatchEvent(new BaseEvent(UI_QINGCHULONGWEN_CLICK,"",{
                        "id":int(this.curSelectItem.name),
                        "biaoshi":1
                     }));
                  }
               }
            }
            else
            {
               TimerHelper.addDelayCallBack(200,callback2);
            }
         }
      }
      
      public function showJinDu(param1:int, param2:int, param3:int) : void
      {
         var callback:Function;
         var callback1:Function;
         var isChengGong:int = param1;
         var isKuaiJie:int = param2;
         var yanse:int = param3;
         if(isChengGong == 1)
         {
            callback = function():void
            {
               if(_loadBuffer)
               {
                  _loadBuffer.close();
               }
               dispatchEvent(new BaseEvent(UI_GETZHUANGBEIINFO,"",{"id":int(curSelectItem.name)}));
            };
            if(this._loadBuffer)
            {
               this._loadBuffer.close();
            }
            this._loadBuffer = LoadBuffer.show(this);
            SmallLoadingBar.showLoading(LanResManager.getLanCommonTextWords("正在刻画龙纹"),3000);
            TimerHelper.addDelayCallBack(3000,callback);
         }
         else
         {
            this.yongyoujinpiaoText.htmlText = LanResManager.getLanCommonTextWords("拥有") + "           " + NumberFormatter.formatThousands(GameInstance.mainCharData.moneyInfo.jinpiao);
            if(Boolean(isChengGong == 0) && Boolean(isKuaiJie) && this.isKuaijieING)
            {
               callback1 = function():void
               {
                  if(curSelectItem)
                  {
                     dispatchEvent(new BaseEvent(UI_LONGWENKEHUA_CLICK,"",{
                        "id":int(curSelectItem.name),
                        "biaoshi":int(checkbox.selectState),
                        "shifoukuaijie":1,
                        "kuaijieID":int(selectList.selectItem.id)
                     }));
                  }
               };
               TimerHelper.addDelayCallBack(200,callback1);
            }
            else if(Boolean(isChengGong == 2) && Boolean(isKuaiJie) && this.isKuaijieING)
            {
               this.kuaijieKehua.label = LanResManager.getLanCommonTextWords("快捷刻画");
               this.isKuaijieING = false;
            }
         }
      }
   }
}

import com.fireice.checkBox.FCheckBox;
import com.fireice.panel.FCanvas;
import com.fireice.text.FTextArea;
import com.fireice.util.FLoader;
import com.tgame.common.GameConfig;
import com.tgame.common.res.lan.*;
import com.tgame.common.ui.componets.*;
import com.zcp.common.events.BaseEvent;
import flash.display.DisplayObject;
import flash.display.Sprite;
import flash.events.MouseEvent;
import flash.text.*;

class LongWenKeHuaTipCanvas extends FCanvas
{
   
   public var $parent:DisplayObject;
   
   private var okBtn:SecondButton;
   
   private var cancelBtn:SecondButton;
   
   private var checkBox:FCheckBox;
   
   private var curSelectItem:ItemFace;
   
   private var ft:FTextArea;
   
   public function LongWenKeHuaTipCanvas(param1:int, param2:ItemFace)
   {
      var _count:int = param1;
      var _curSelectItem:ItemFace = param2;
      this.ft = new FTextArea();
      super();
      this.curSelectItem = _curSelectItem;
      skin = "menuBg";
      with(this.ft)
      {
         x = 5;
         y = 15;
         autoSize = TextFieldAutoSize.LEFT;
         filters = StaticValue.filter;
         htmlText = "<textformat leading=\'4\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("本次使用：") + "</font>" + "<font color=\'" + StaticValue.RED_HTML + "\'>" + (_count + 1) * 10 + "<font color=\'" + StaticValue.WHITE_HTML + "\'>元宝可消除已刻画进度最前方</font><br>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("一格的龙纹，消除龙纹所需的元宝数将随") + "</font><br>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("消除次数逐渐增多，每日凌晨00:00时消") + "</font><br>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("除次数将重置为0.") + "</font><br>" + "<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("是否确定清除?") + "</font>";
      }
      addChild(this.ft);
      this.okBtn = new SecondButton();
      this.okBtn.label = LanResManager.getLanCommonTextWords("确定");
      addChild(this.okBtn);
      this.okBtn.x = 50;
      this.okBtn.y = this.ft.y + this.ft.height + 20;
      this.okBtn.addEventListener(MouseEvent.CLICK,this.onClick);
      this.cancelBtn = new SecondButton();
      this.cancelBtn.label = LanResManager.getLanCommonTextWords("取消");
      addChild(this.cancelBtn);
      this.cancelBtn.x = this.ft.x + this.ft.width - 45 - this.cancelBtn.width;
      this.cancelBtn.y = this.ft.y + this.ft.height + 20;
      this.cancelBtn.addEventListener(MouseEvent.CLICK,this.onClick);
      this.checkBox = new FCheckBox();
      this.checkBox.border = true;
      this.checkBox.textColor = StaticValue.WHITE;
      this.checkBox.text = LanResManager.getLanCommonTextWords("下次不弹出本提示");
      addChild(this.checkBox);
      this.checkBox.x = 5;
      this.checkBox.y = this.okBtn.y + this.okBtn.height + 10;
      this.checkBox.addEventListener(MouseEvent.CLICK,this.onClick);
      width = this.ft.width + 10;
      height = this.checkBox.y + this.checkBox.height + 5;
   }
   
   public function updata(param1:int) : void
   {
      this.ft.htmlText = "<textformat leading=\'4\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("本次使用：") + "</font>" + "<font color=\'" + StaticValue.RED_HTML + "\'>" + (param1 + 1) * 10 + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("元宝可消除已刻画进度最前方") + "</font><br>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("一格的龙纹，消除龙纹所需的元宝数将随") + "</font><br>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("消除次数逐渐增多，每日凌晨00:00时消") + "</font><br>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("除次数将重置为0.") + "</font><br>" + "<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("是否确定清除?") + "</font>";
   }
   
   private function onClick(param1:MouseEvent) : void
   {
      switch(param1.target)
      {
         case this.okBtn:
            this.$parent.dispatchEvent(new BaseEvent(LongWenKeHuaPanel.UI_QINGCHULONGWEN_CLICK,"",{"id":int(this.curSelectItem.name)}));
            POPWindowManager.closeWindow();
            break;
         case this.cancelBtn:
            POPWindowManager.closeWindow();
            break;
         case this.checkBox:
            (this.$parent as LongWenKeHuaPanel).istishi = !this.checkBox.selectState;
      }
   }
}

class JinDuSprite extends Sprite
{
   
   private var bg:DisplayObject;
   
   public function JinDuSprite()
   {
      super();
      this.bg = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/longwenkehua/hong.png",26,28);
      addChild(this.bg);
   }
   
   public function setImg(param1:String) : void
   {
      this.clear();
      this.bg = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/longwenkehua/" + param1 + ".png",26,28);
      addChild(this.bg);
   }
   
   public function clear() : void
   {
      while(this.numChildren > 0)
      {
         this.removeChildAt(0);
      }
   }
}
