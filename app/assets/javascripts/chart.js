var chart = c3.generate({
    data: {
        columns: [
            ['Lulu', 50],
            ['Olaf', 50],
        ],
        type : 'donut'
    },
    donut: {
        title: "Dogs love:",
    }
});



$.get("http://localhost:3000/data_files/4/download.json", function(data) {
    console.log(data);
  }
});
