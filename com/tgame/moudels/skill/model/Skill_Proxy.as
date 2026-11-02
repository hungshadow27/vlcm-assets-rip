package com.tgame.moudels.skill.model
{
   import com.tgame.common.GameInstance;
   import com.tgame.common.vo.character.Player;
   import com.tgame.common.vo.character.info.SkillInfo;
   import com.tgame.common.vo.item.Skill;
   import com.tgame.moudels.Item.view.Item_BackpackMediator;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class Skill_Proxy extends Proxy
   {
      
      public static const NAME:String = "Skill_Proxy";
      
      private var _backPackMediator:Item_BackpackMediator;
      
      public function Skill_Proxy(param1:Object = null)
      {
         super(NAME,param1);
      }
      
      protected function get backPackMediator() : Item_BackpackMediator
      {
         if(this._backPackMediator == null)
         {
            this._backPackMediator = facade.retrieveMediator(Item_BackpackMediator.NAME) as Item_BackpackMediator;
         }
         return this._backPackMediator;
      }
      
      public function initBagItem() : void
      {
         this.backPackMediator.showItemBag(1);
      }
      
      public function getSkill(param1:int) : Skill
      {
         var _loc2_:Player = GameInstance.mainChar.data as Player;
         var _loc3_:SkillInfo = _loc2_.skillInfo;
         return _loc3_.getSkillByID(param1);
      }
   }
}

