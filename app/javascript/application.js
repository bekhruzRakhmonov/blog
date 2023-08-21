// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
//= require jquery
//= require jquery_ujs
import "@hotwired/turbo-rails"
import "controllers"

import "popper"

import "bootstrap"

const photosInput = document.getElementById("photos"); // Change this to select the input element by its ID


const multiPhotoDisplay = (input) => {
  if (input.files && input.files.length > 0) {
    const photosClearing = document.getElementById('photos_clearing');
    
    for (const file of input.files) {
      const reader = new FileReader();

      reader.onload = (e) => {
        const image_html = `<li class="col-md-3"><a class="th" href="${e.target.result}"><img width="200" src="${e.target.result}"></a></li>`;
        photosClearing.innerHTML += image_html;

        const picsLabel = document.querySelector('.pics-label.d-none');
        if (picsLabel !== null) {
          picsLabel.classList.remove('d-none');
          picsLabel.style.display = 'block';
        }
      };

      reader.readAsDataURL(file);
    }
  }
};
  

if (photosInput) {
  photosInput.addEventListener("change", (event) => {
      multiPhotoDisplay(event.target);
  });
}

// charts
document.addEventListener('DOMContentLoaded', async () => {
  
  if (window.location.pathname == "/admin" || window.location.pathname == "/admin/") {

    const response = await fetch('/admin/dashboard/statistics');
    const statistics = await response.json()
    
    const yearlyUserSignups = statistics["yearly_user_signups"]
    const monthlyUserSignups = statistics["monthly_user_signups"]
    const weeklyUserSignups = statistics["weekly_user_signups"]

    const yearlyPostCounts = statistics["yearly_post_counts"]
    const monthlyPostCounts = statistics["monthly_post_counts"]
    const weeklyPostCounts = statistics["weekly_post_counts"]

    const yearlyPostViews = statistics["yearly_post_views"]
    const monthlyPostViews = statistics["monthly_post_views"]
    const weeklyPostViews = statistics["weekly_post_views"]



    const yearlyUserSignupsChart = new Chart(document.getElementById('yearlyUserSignupsChart').getContext('2d'), {
      type: 'bar',
      data: {
        labels: yearlyUserSignups.map((obj) => obj.year),
        datasets: [{
          label: 'Yearly User Signups',
          data: yearlyUserSignups.map((obj) => obj.signups),
          backgroundColor: 'rgba(75, 192, 192, 0.2)',
          borderColor: 'rgba(75, 192, 192, 1)',
          borderWidth: 1,
        }],
      },
    });
    const monthlyUserSignupsChart = new Chart(document.getElementById('monthlyUserSignupsChart').getContext('2d'), {
      type: 'line',
      data: {
        labels: monthlyUserSignups.map((obj) => obj.month),
        datasets: [{
          label: 'Monthly User Signups',
          data: monthlyUserSignups.map((obj) => obj.signups),
          borderColor: 'rgba(75, 192, 192, 1)',
          borderWidth: 2,
          fill: false,
        }],
      },
    });

    const weeklyUserSignupsChart = new Chart(document.getElementById('weeklyUserSignupsChart').getContext('2d'), {
      type: 'bar',
      data: {
        labels: weeklyUserSignups.map((obj) => obj.week),
        datasets: [{
          label: 'Weekly User Signups',
          data: weeklyUserSignups.map((obj) => obj.signups),
          backgroundColor: 'rgba(75, 192, 192, 0.2)',
          borderColor: 'rgba(75, 192, 192, 1)',
          borderWidth: 1,
        }],
      },
    });


    // Display yearly post counts
    const yearlyPostCountsChart = new Chart(document.getElementById('yearlyPostCountsChart').getContext('2d'), {
      type: 'bar',
      data: {
        labels: yearlyPostCounts.map((obj) => obj.year),
        datasets: [{
          label: 'Yearly Post Counts',
          data: yearlyPostCounts.map((obj) => obj.post_count),
          backgroundColor: 'rgba(54, 162, 235, 0.2)',
          borderColor: 'rgba(75, 192, 192, 1)',
          borderWidth: 1,
        }],
      },
    });

    // Display monthly post counts
    const monthlyPostCountsChart = new Chart(document.getElementById('monthlyPostCountsChart').getContext('2d'), {
      type: 'bar',
      data: {
        labels: monthlyPostCounts.map((obj) => obj.month),
        datasets: [{
          label: 'Monthly Post Counts',
          data: monthlyPostCounts.map((obj) => obj.post_count),
          backgroundColor: 'rgba(54, 162, 235, 0.2)',
          borderColor: 'rgba(75, 192, 192, 1)',
          borderWidth: 1,
        }],
      },
    });

    // Display weekly post counts
    const weeklyPostCountsChart = new Chart(document.getElementById('weeklyPostCountsChart').getContext('2d'), {
      type: 'line',
      data: {
        labels: weeklyPostCounts.map((obj) => obj.week),
        datasets: [{
          label: 'Weekly Post Counts',
          data: weeklyPostCounts.map((obj) => obj.post_count),
          backgroundColor: 'rgba(54, 162, 235, 0.2)',
          borderColor: 'rgba(75, 192, 192, 1)',
          borderWidth: 1,
        }],
      },
    });


    // Display yearly post views
    const yearlyPostViewsChart = new Chart(document.getElementById('yearlyPostViewsChart').getContext('2d'), {
      type: 'bar',
      data: {
        labels: yearlyPostViews.map((obj) => obj.year),
        datasets: [{
          label: 'Yearly Post Views',
          data: yearlyPostViews.map((obj) => obj.views),
          backgroundColor: 'rgba(255, 205, 86, 0.2)',
          borderColor: 'rgba(75, 192, 192, 1)',
          borderWidth: 1,
        }],
      },
    });

    // Display monthly post views
    const monthlyPostViewsChart = new Chart(document.getElementById('monthlyPostViewsChart').getContext('2d'), {
      type: 'bar',
      data: {
        labels: monthlyPostViews.map((obj) => obj.month),
        datasets: [{
          label: 'Monthly Post Views',
          data: monthlyPostViews.map((obj) => obj.views),
          backgroundColor: 'rgba(255, 205, 86, 0.2)',
          borderColor: 'rgba(75, 192, 192, 1)',
          borderWidth: 1,
        }],
      },
    });

    // Display weekly post views
    const weeklyPostViewsChart = new Chart(document.getElementById('weeklyPostViewsChart').getContext('2d'), {
      type: 'bar',
      data: {
        labels: weeklyPostViews.map((obj) => obj.week),
        datasets: [{
          label: 'Weekly Post Views',
          data: weeklyPostViews.map((obj) => obj.views),
          backgroundColor: 'rgba(255, 205, 86, 0.2)',
          borderColor: 'rgba(75, 192, 192, 1)',
          borderWidth: 1,
        }],
      },
    });
  };
});
