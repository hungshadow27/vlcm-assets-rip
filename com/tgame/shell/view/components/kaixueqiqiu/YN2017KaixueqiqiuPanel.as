package com.tgame.shell.view.components.kaixueqiqiu
{
   import com.asQuery.$;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.BasePanel;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.vo.item.Goods;
   import com.zcp.common.events.BaseEvent;
   import flash.events.MouseEvent;
   import game.display.Container;
   import game.display.List;
   import game.skin.RuXueQiQiuSkin;
   import game.utils.SkinTools;
   
   public class YN2017KaixueqiqiuPanel extends BasePanel
   {
      
      public static const QINGQIUKAIXUEQIQIULINGJIANG:String = "QINGQIUKAIXUEQIQIULINGJIANG";
      
      public static const QINGQIUKAIXUEQIQIUTIJIAO:String = "QINGQIUKAIXUEQIQIUTIJIAO";
      
      private var _container:Container;
      
      private var item:ItemFace;
      
      private var list1:List;
      
      private var list2:List;
      
      private var list3:List;
      
      private var arr:Array = [727995,727997,727996];
      
      private var arrName:Array = [LanResManager.getLanCommonTextWords("蓝气球"),LanResManager.getLanCommonTextWords("黄气球"),LanResManager.getLanCommonTextWords("红气球")];
      
      public function YN2017KaixueqiqiuPanel()
      {
         super();
         this.skin = SkinTools.getChildSkinByName(RuXueQiQiuSkin.skin,"ruxueqiqiu");
      }
      
      override protected function createVariableReference() : void
      {
         var i:int;
         this.list1 = getChildByName("liebiao1") as List;
         this.list1.ItemClass = ListElement;
         this.list1.verticalGap = 8;
         this.list2 = getChildByName("liebiao2") as List;
         this.list2.ItemClass = ListElement2;
         this.list2.verticalGap = 8;
         this.list3 = getChildByName("liebiao3") as List;
         this.list3.ItemClass = ListElement3;
         this.list3.verticalGap = 8;
         $("lingqu1 lingqu2 lingqu3 lingqu4 lingqu5 lingqu6 tijiao1 tijiao2 tijiao3",this,true).click(this.clickHanlder);
         $("guanbi",this,true).click(function():*
         {
            onClose();
         });
         $("zhuyiwenben",this,true).attr("visible",false);
         i = 0;
         while(i < this.arr.length)
         {
            this.item = new ItemFace(new Goods(this.arr[i]));
            addChild(this.item);
            this.item.x = 19 + i * 216;
            this.item.y = 64;
            i++;
         }
      }
      
      public function setData(param1:Object) : void
      {
         this.list2.DataSource = param1.lanqiqiuArr;
         this.list3.DataSource = param1.huangqiqiuArr;
         this.list1.DataSource = param1.hongqiqiuArr;
         $("shuliangwenben2",this,true).attr("text",param1.lanqiqiunum);
         $("shuliangwenben3",this,true).attr("text",param1.huangqiqiunum);
         $("shuliangwenben1",this,true).attr("text",param1.hongqiqiunum);
         if(param1.lanqiqiunum == 0)
         {
         }
         var _loc2_:Array = param1.zongpaiming;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_.length)
         {
            switch(_loc2_[_loc3_].mingci)
            {
               case 1:
                  $("qiu1",this,true).attr("text",this.arrName[int(_loc2_[_loc3_].name) - 1]);
                  break;
               case 2:
                  $("qiu2",this,true).attr("text",this.arrName[int(_loc2_[_loc3_].name) - 1]);
                  break;
               case 3:
                  $("qiu3",this,true).attr("text",this.arrName[int(_loc2_[_loc3_].name) - 1]);
            }
            _loc3_++;
         }
      }
      
      private function clickHanlder(param1:MouseEvent) : void
      {
         switch(param1.target.name)
         {
            case "lingqu4":
               dispatchEvent(new BaseEvent(QINGQIUKAIXUEQIQIULINGJIANG,"",1));
               break;
            case "lingqu5":
               dispatchEvent(new BaseEvent(QINGQIUKAIXUEQIQIULINGJIANG,"",2));
               break;
            case "lingqu6":
               dispatchEvent(new BaseEvent(QINGQIUKAIXUEQIQIULINGJIANG,"",3));
               break;
            case "lingqu2":
               dispatchEvent(new BaseEvent(QINGQIUKAIXUEQIQIULINGJIANG,"",4));
               break;
            case "lingqu3":
               dispatchEvent(new BaseEvent(QINGQIUKAIXUEQIQIULINGJIANG,"",5));
               break;
            case "lingqu1":
               dispatchEvent(new BaseEvent(QINGQIUKAIXUEQIQIULINGJIANG,"",6));
               break;
            case "tijiao2":
               dispatchEvent(new BaseEvent(QINGQIUKAIXUEQIQIUTIJIAO,"",1));
               break;
            case "tijiao3":
               dispatchEvent(new BaseEvent(QINGQIUKAIXUEQIQIUTIJIAO,"",2));
               break;
            case "tijiao1":
               dispatchEvent(new BaseEvent(QINGQIUKAIXUEQIQIUTIJIAO,"",3));
         }
      }
   }
}

import com.asQuery.$;
import game.display.ListItemRender;

class ListElement extends ListItemRender
{
   
   public function ListElement()
   {
      super();
      this.buttonMode = true;
   }
   
   override protected function createVariableReference() : void
   {
      super.createVariableReference();
   }
   
   override public function set data(param1:Object) : void
   {
      super.data = param1;
      $("wenben1",this,true).attr("text",param1.mingci);
      $("wenben2",this,true).attr("text",param1.name);
      $("wenben3",this,true).attr("text",param1.num);
   }
}

class ListElement2 extends ListItemRender
{
   
   public function ListElement2()
   {
      super();
      this.buttonMode = true;
   }
   
   override protected function createVariableReference() : void
   {
      super.createVariableReference();
   }
   
   override public function set data(param1:Object) : void
   {
      super.data = param1;
      $("wenben4",this,true).attr("text",param1.mingci);
      $("wenben5",this,true).attr("text",param1.name);
      $("wenben6",this,true).attr("text",param1.num);
   }
}

class ListElement3 extends ListItemRender
{
   
   public function ListElement3()
   {
      super();
      this.buttonMode = true;
   }
   
   override protected function createVariableReference() : void
   {
      super.createVariableReference();
   }
   
   override public function set data(param1:Object) : void
   {
      super.data = param1;
      $("wenben7",this,true).attr("text",param1.mingci);
      $("wenben8",this,true).attr("text",param1.name);
      $("wenben9",this,true).attr("text",param1.num);
   }
}
