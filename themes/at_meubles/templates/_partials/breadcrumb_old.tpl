{**
 * 2007-2017 PrestaShop
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Academic Free License 3.0 (AFL-3.0)
 * that is bundled with this package in the file LICENSE.txt.
 * It is also available through the world-wide-web at this URL:
 * https://opensource.org/licenses/AFL-3.0
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to license@prestashop.com so we can send you a copy immediately.
 *
 * DISCLAIMER
 *
 * Do not edit or add to this file if you wish to upgrade PrestaShop to newer
 * versions in the future. If you wish to customize PrestaShop for your
 * needs please refer to http://www.prestashop.com for more information.
 *
 * @author    PrestaShop SA <contact@prestashop.com>
 * @copyright PrestaShop SA
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
 * International Registered Trademark & Property of PrestaShop SA
 *}
 <nav data-depth="{$breadcrumb.count}" class="breadcrumb">
  <div class="category-cover">
    {if $page.page_name == 'category'}
      {if $category.image.large.url}
        <img class="img-fluid" src="{$category.image.large.url}" alt="{if !empty($category.image.legend)}{$category.image.legend}{else}{$category.name}{/if}">
      {/if}
    {else}
      <img class="img-fluid" src="{$urls.img_url}bg-breadcrumb.jpg" alt="Breadcrumb image">
    {/if}
    <div class="category-name-cover">
      {if $page.page_name == 'category' && $page.page_name != 'index'}
        <h1 class="h1 category-name">{$category.name}</h1>
      {/if}
      {if $page.page_name == 'category'}
        {if $listing.pagination.total_items > 1}
          <p class="products-counter">{l s='%product_count% items' d='Shop.Theme.Catalog' sprintf=['%product_count%' => $listing.pagination.total_items]}</p>
        {else if $listing.pagination.total_items > 0}
          <p class="products-counter">{l s='1 item' d='Shop.Theme.Catalog'}</p>
        {/if}
      {/if}
    </div>
  </div>

  <div class="breadcrumb-heading">
    <div class="container">
      <ol itemscope itemtype="http://schema.org/BreadcrumbList">
    {block name='breadcrumb'}
        {foreach from=$breadcrumb.links item=path name=breadcrumb}
        {block name='breadcrumb_item'}
        <li itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem">
          <a itemprop="item" href="{$path.url}">
            <span itemprop="name">{$path.title}</span>
          </a>
          <meta itemprop="position" content="{$smarty.foreach.breadcrumb.iteration}">
        </li>
        {/block}
        {/foreach}
    {/block}
      </ol>
    </div>
  </div>
</nav>
