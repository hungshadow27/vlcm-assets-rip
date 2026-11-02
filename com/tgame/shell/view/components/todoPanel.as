package com.tgame.shell.view.components
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.list.FList;
   import com.fireice.panel.FCanvas;
   import com.fireice.scroll.FVScorllBar;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.manager.MainCharSeachPathManager;
   import com.tgame.shell.view.components.todo.TodoListRender;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   
   public class todoPanel extends Sprite
   {
      
      public static const UI_TODO_TEXT_SUB:String = "UI_TODO_TEXT_SUB";
      
      public static const UI_TODO_LIST:String = "UI_TODO_LIST";
      
      private var lb:FLabel;
      
      private var wcrw:FTextArea;
      
      private var cdzf:FTextArea;
      
      private var sxsj:FLabel;
      
      private var ft:FTextArea;
      
      private var hdjy:FTextArea;
      
      private var hdzqcl:FTextArea;
      
      private var subBtn:SecondButton;
      
      private var listContainer:Sprite;
      
      private var giftList:FList;
      
      private var Scroll:FVScorllBar;
      
      private var kuangBg:FCanvas;
      
      private var ft1:FTextArea;
      
      private var ft2:FTextArea;
      
      private var ft3:FTextArea;
      
      private var ft4:FTextArea;
      
      private var ft5:FTextArea;
      
      public function todoPanel()
      {
         var ft:FTextArea;
         var img:Bitmap = null;
         super();
         this.kuangBg = new FCanvas();
         this.kuangBg.skin = "box";
         addChild(this.kuangBg);
         this.kuangBg.width = 590;
         this.kuangBg.height = 346;
         this.kuangBg.y = 2;
         this.listContainer = new Sprite();
         addChild(this.listContainer);
         with(this.listContainer)
         {
            x = 0;
            y = 3;
            graphics.beginFill(16711680,0);
            graphics.drawRect(0,0,563,340);
            graphics.endFill();
         }
         img = StaticValue.getBitmapByClassName("ui.info.chaxun.black.line");
         this.listContainer.addChild(img);
         img.width = 566;
         img.y = 2;
         img.x = 3;
         ft = new FTextArea();
         with(ft)
         {
            wordWrap = true;
            x = 6;
            y = 8;
            width = 580;
            height = 20;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            htmlText = LanResManager.getLanCommonTextWords("变强推荐");
         }
         this.listContainer.addChild(ft);
         this.ft1 = new FTextArea();
         with(this.ft1)
         {
            wordWrap = true;
            x = 6;
            y = 27;
            width = 580;
            height = 20;
            textColor = StaticValue.RED;
            filters = StaticValue.filter;
            htmlText = "";
         }
         this.listContainer.addChild(this.ft1);
         this.ft2 = new FTextArea();
         with(this.ft2)
         {
            wordWrap = true;
            x = 26;
            y = 44;
            width = 520;
            height = 120;
            textColor = StaticValue.GREEN;
            filters = StaticValue.filter;
            htmlText = "";
         }
         this.listContainer.addChild(this.ft2);
         img = StaticValue.getBitmapByClassName("ui.info.chaxun.black.line");
         this.listContainer.addChild(img);
         img.width = 566;
         img.y = 158;
         img.x = 2;
         this.lb = new FLabel();
         with(this.lb)
         {
            x = 6;
            y = 164;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("全天收益");
         }
         this.listContainer.addChild(this.lb);
         ft = new FTextArea();
         with(ft)
         {
            x = 6;
            y = 187;
            width = 110;
            textColor = StaticValue.WHITE;
            htmlText = LanResManager.getLanTextWords(this,"今日收益");
         }
         this.listContainer.addChild(ft);
         this.ft3 = new FTextArea();
         with(this.ft3)
         {
            x = 106;
            y = 187;
            width = 110;
            textColor = StaticValue.WHITE;
            htmlText = LanResManager.getLanCommonTextWords("获得经验");
         }
         this.listContainer.addChild(this.ft3);
         ft = new FTextArea();
         with(ft)
         {
            x = 186;
            y = 187;
            width = 110;
            textColor = StaticValue.WHITE;
            htmlText = LanResManager.getLanTextWords(this,"今日收益2");
         }
         this.listContainer.addChild(ft);
         this.ft4 = new FTextArea();
         with(this.ft4)
         {
            x = 286;
            y = 187;
            width = 110;
            textColor = StaticValue.WHITE;
            htmlText = "186";
         }
         this.listContainer.addChild(this.ft4);
         ft = new FTextArea();
         with(ft)
         {
            x = 366;
            y = 187;
            width = 110;
            textColor = StaticValue.WHITE;
            htmlText = LanResManager.getLanTextWords(this,"今日收益5");
         }
         this.listContainer.addChild(ft);
         this.ft5 = new FTextArea();
         with(this.ft5)
         {
            x = 466;
            y = 187;
            width = 110;
            textColor = StaticValue.WHITE;
            htmlText = "187";
         }
         this.listContainer.addChild(this.ft5);
         this.giftList = new FList();
         this.giftList.skin = "list";
         this.giftList.itemRenderer = new TodoListRender();
         this.giftList.listWidth = 566;
         this.listContainer.addChild(this.giftList);
         this.giftList.x = 0;
         this.giftList.y = 240;
         this.Scroll = new FVScorllBar(this.listContainer,340);
         addChild(this.Scroll);
         this.Scroll.x = 571;
         this.Scroll.y = 3;
      }
      
      private function onListClick(param1:MouseEvent) : void
      {
         if(param1.target is FTextArea && param1.target.name == "dianji")
         {
            if(this.giftList.selectItem.dianji == 1)
            {
               this.giftList.selectItem.fun(this.giftList.selectItem.tid);
            }
            else if(this.giftList.selectItem.dianji == 2)
            {
               MainCharSeachPathManager.mainCharWalk(this.giftList.selectItem._nid);
            }
         }
      }
      
      private function onClick(param1:BaseEvent) : void
      {
         switch(param1.data)
         {
            case 1:
               dispatchEvent(new BaseEvent(UI_TODO_TEXT_SUB,"",1));
               break;
            case 2:
               dispatchEvent(new BaseEvent(UI_TODO_TEXT_SUB,"",2));
         }
      }
      
      private function onClose(param1:FCloseEvent) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      public function SetInitialize(param1:Array) : void
      {
         var _loc9_:Object = null;
         var _loc10_:Object = null;
         var _loc11_:Object = null;
         var _loc2_:Array = new Array();
         var _loc3_:Array = param1[0];
         var _loc4_:Array = param1[1];
         var _loc5_:Array = (param1[2] as String).split(",");
         var _loc6_:int = 0;
         while(_loc6_ < _loc3_.length)
         {
            _loc9_ = new Object();
            if(_loc6_ == 0)
            {
               _loc9_.time = LanResManager.getLanCommonTextWords("待完成任务") + "：";
            }
            else
            {
               _loc9_.time = "";
            }
            _loc9_.weizhi = 1;
            _loc9_.dianji = 1;
            _loc9_.fun = _loc3_[_loc6_].fun;
            _loc9_.tid = _loc3_[_loc6_].tid;
            _loc9_.content = _loc3_[_loc6_].str + "（" + _loc3_[_loc6_].n1 + "/" + _loc3_[_loc6_].n2 + "）";
            _loc9_._parent = this;
            _loc2_.push(_loc9_);
            _loc6_++;
         }
         var _loc7_:int = 0;
         while(_loc7_ < _loc4_.length)
         {
            _loc10_ = new Object();
            if(_loc7_ == 0)
            {
               _loc10_.time = LanResManager.getLanCommonTextWords("待闯的副本") + "：";
            }
            else
            {
               _loc10_.time = "";
            }
            _loc10_.weizhi = 1;
            _loc10_.dianji = 2;
            _loc10_.fun = _loc4_[_loc7_].fun;
            _loc10_.tid = _loc4_[_loc7_].tid;
            _loc10_.content = _loc4_[_loc7_].str + "（" + _loc4_[_loc7_].n1 + "/" + _loc4_[_loc7_].n2 + "）";
            _loc10_._parent = this;
            _loc2_.push(_loc10_);
            _loc7_++;
         }
         var _loc8_:int = 0;
         while(_loc8_ < _loc5_.length)
         {
            _loc11_ = new Object();
            if(_loc8_ == 0)
            {
               _loc11_.time = LanResManager.getLanCommonTextWords("下轮BOSS刷新时间") + "：";
            }
            else
            {
               _loc11_.time = "";
            }
            _loc11_.weizhi = 2;
            _loc11_.dianji = 0;
            _loc11_.content = _loc5_[_loc8_];
            _loc11_._parent = this;
            _loc2_.push(_loc11_);
            _loc8_++;
         }
         this.giftList.dataProvider = _loc2_;
         this.Scroll.update();
         this.ft3.htmlText = param1[3] + "<br>" + param1[4] + "<br>" + param1[5];
         this.ft4.htmlText = param1[6] + "<br>" + param1[7];
         this.ft5.htmlText = param1[9];
         if(param1[10] == 0)
         {
            this.ft1.htmlText = LanResManager.getLanTextWords(this,"您的经脉尚未全通，建议尽快冲通");
            this.ft2.htmlText = LanResManager.getLanTextWords(this,"冲穴增益");
         }
         else if(param1[10] == 1)
         {
            this.ft1.htmlText = LanResManager.getLanTextWords(this,"您还有装备不是满星，建议凑齐");
            this.ft2.htmlText = LanResManager.getLanTextWords(this,"满星增益");
         }
         else if(param1[10] == 2)
         {
            this.ft1.htmlText = LanResManager.getLanTextWords(this,"您的坐骑不妨继续进阶");
            this.ft2.htmlText = LanResManager.getLanTextWords(this,"坐骑增益");
         }
         else if(param1[10] == 3)
         {
            this.ft1.htmlText = LanResManager.getLanTextWords(this,"您的暗器尚未到顶，建议提升");
            this.ft2.htmlText = LanResManager.getLanTextWords(this,"暗器增益");
         }
         else if(param1[10] == 4)
         {
            this.ft1.htmlText = LanResManager.getLanTextWords(this,"您的装备尚未镶满六品玉石");
            this.ft2.htmlText = LanResManager.getLanTextWords(this,"宝石增益");
         }
         else if(param1[10] == 5)
         {
            this.ft1.htmlText = LanResManager.getLanTextWords(this,"您的护身符不妨进阶到顶且镶嵌舍利子");
            this.ft2.htmlText = LanResManager.getLanTextWords(this,"护身符增益");
         }
         else if(param1[10] == 6)
         {
            this.ft1.htmlText = LanResManager.getLanTextWords(this,"您的肉身境界未到圆满境界，建议提升");
            this.ft2.htmlText = LanResManager.getLanTextWords(this,"肉身增益");
         }
         else if(param1[10] == 7)
         {
            this.ft1.htmlText = LanResManager.getLanTextWords(this,"您的装备尚未刻满图腾战纹");
            this.ft2.htmlText = LanResManager.getLanTextWords(this,"战纹增益");
         }
         else if(param1[10] == 8)
         {
            this.ft1.htmlText = LanResManager.getLanTextWords(this,"您的装备所刻图腾战纹类型不够一致");
            this.ft2.htmlText = LanResManager.getLanTextWords(this,"战纹增益2");
         }
         else if(param1[10] == -1)
         {
            this.ft1.htmlText = LanResManager.getLanTextWords(this,"您当前的人物等级是您继续变强的瓶颈所在");
            this.ft2.htmlText = LanResManager.getLanTextWords(this,"武功增益");
         }
      }
   }
}

